class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]

  ]
  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(move)
    move.to_s
    move.to_i-1
  end
  def move(board, player = "X")
    @board[board]=player
  end
  def position_taken?(position)
    @board[position] != " "? true : false
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    count = 0
    @board.each { |e| count+=1 if e != " " }
    count
  end
  def current_player
    if turn_count % 2==0
      "X"
    else
      "O"
    end
  end
  def turn
    puts "Enter"
    input = gets.chomp
    index = input_to_index(input)
    while !valid_move?(index)
      puts "Enter"
      input = gets.chomp
      index = input_to_index(input)
    end
    player_token =current_player
    move(index, player_token)
    display_board
  end
end
