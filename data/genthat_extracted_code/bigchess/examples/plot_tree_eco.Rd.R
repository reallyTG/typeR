library(bigchess)


### Name: plot_tree_eco
### Title: Plot tree for a given tree ECO table
### Aliases: plot_tree_eco

### ** Examples

f <- system.file("extdata", "Kasparov.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,stat.moves = FALSE, add.tags = "ECO")
tr <- tree_eco(subset(df,W1=="e4"),20)
plot_tree_eco(tr,"1. e4 ... ?")



