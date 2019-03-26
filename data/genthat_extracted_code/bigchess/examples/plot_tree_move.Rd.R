library(bigchess)


### Name: plot_tree_move
### Title: Plot tree for a given tree move table
### Aliases: plot_tree_move

### ** Examples

f <- system.file("extdata", "Kasparov.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,stat.moves = FALSE)
tr <- tree_move(subset(df,W1=="e4"),"B1")
plot_tree_move(tr,"1. e4 ... ?")
# Plot tree move openings in aggregated data
tr <- tree_move(FirstTwoMoves,"W1")
plot_tree_move(tr,paste0("1. ... ?\n",sum(FirstTwoMoves$Freq)," total games"))



