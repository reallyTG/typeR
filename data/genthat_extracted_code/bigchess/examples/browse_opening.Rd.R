library(bigchess)


### Name: browse_opening
### Title: Browse opening
### Aliases: browse_opening

### ** Examples

f <- system.file("extdata", "Kasparov.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,ignore.other.games = TRUE,stat.moves = FALSE)
# Analyze best Kasparov openings:
bo <- browse_opening(subset(df,grepl("Kasparov",White)))
# Analyze 'best' answer to Kasparov Ruy Lopez:
bo <- browse_opening(subset(df,grepl("Kasparov",White)),"1.e4 e5 2.Nf3 Nc6 3.Bb5")
# Analyze best answer to "1.e4 e5 2.Nf3" in aggregated data
browse_opening(FirstTwoMoves,"1.e4 e5 2.Nf3")



