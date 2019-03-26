library(bigchess)


### Name: tree_move
### Title: Compute tree for a given move
### Aliases: tree_move

### ** Examples

f <- system.file("extdata", "Kasparov.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,stat.moves = FALSE)
# Analyze best answers to 1. e4 in Kasparov games (both white and black)
tree_move(subset(df,W1=="e4"),move = "B1")
# Analyze openings in aggregated data
tree_move(FirstTwoMoves,"W1")



