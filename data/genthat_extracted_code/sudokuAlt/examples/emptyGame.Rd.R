library(sudokuAlt)


### Name: emptyGame
### Title: Construct an empty game
### Aliases: emptyGame

### ** Examples

g <- emptyGame(4)
diag(g) <- LETTERS[1:16]
g %>% solve %>% plot -> sg ## %>% imported from magrittr



