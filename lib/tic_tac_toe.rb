WIN_COMBINATIONS = [
[0,1,2], #top_row_win
[3,4,5], #middle_row_win
[6,7,8], #bottom_row_win
[0,3,6], #vertical_left_win
[1,4,7], #vertical_middle_win
[2,5,8], #vertical_right_win
[0,4,8], #diagonal_left_win
[2,4,6] #diagonal_right_win

]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
   counter = 0
   board.each { |position|
     if position == "X" || position == "O"
     counter +=1
 end }
 counter
 end

 def current_player(board)
   turn_count(board).even? ? "X" : "O"
 end

 def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board[win_index_1] # load the value of the board at win_index_1
     position_2 = board[win_index_2] # load the value of the board at win_index_2
     position_3 = board[win_index_3] # load the value of the board at win_index_3

     if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination # return the win_combination indexes that won.
     end
    end
     false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
  end

  def over?(board)
  won?(board) || draw?(board) || full?(board)
  end

  def winner(board)
  if winning_array = won?(board)
  winning_index = winning_array[0]
  winner = board[winning_index]
end
end

def play(board)
until over?(board)
  turn(board)
end
 if winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) == "O"
  puts "Congratulations O!"
  elsif draw?(board)
  puts "Cat's Game!"
end
end
