library(bigchess)


### Name: tree_eco
### Title: Compute ECO tree
### Aliases: tree_eco

### ** Examples

f <- system.file("extdata", "Kasparov.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,stat.moves = FALSE, add.tags = "ECO")



