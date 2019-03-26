library(sudokuAlt)


### Name: fetchUKGame
### Title: Retrieve a Sudoku from the UK Site
### Aliases: fetchUKGame

### ** Examples

## Not run: 
##D (g0 <- fetchUKGame())  ## The game for today (according to GMT)
##D (g3 <- fetchUKGame(3)) ## game from 3 days ago (according to GMT)
##D if(require(sudoku)) {  ## the original solver
##D   g0a <- as.sudoku(fetchSudokuUK())  
##D   identical(g0, g0a)   ## should be TRUE
##D }
##D g0 %>% solve %>% plot -> sg0 ## spoil the game
## End(Not run)



