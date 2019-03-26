library(sudoku)


### Name: playSudoku
### Title: Interactively play a game of Sudoku
### Aliases: playSudoku
### Keywords: dynamic

### ** Examples

## Not run: 
##D puz1 <- playSudoku(0)        # Use as an editor to create a puzzle, then quit
##D sol1 <- playSudoku(puz1)     # now play the puzzle
##D 
##D puz2 <- edit(matrix(0,9,9))  # Or use this editor
##D sol2 <- playSudoku(puz2)     # now play the puzzle
##D 
##D playSudoku()                 # Play a randomly generated game
##D 
##D playSudoku(fetchSudokuUK())  # Play today's game
## End(Not run)



