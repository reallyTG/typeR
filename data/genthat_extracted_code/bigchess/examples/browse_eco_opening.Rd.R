library(bigchess)


### Name: browse_eco_opening
### Title: Browse ECO opening
### Aliases: browse_eco_opening

### ** Examples

f <- system.file("extdata", "Kasparov.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,ignore.other.games = TRUE,stat.moves = FALSE, add.tags = "ECO")
# Analyze 20 best ECO Kasparov openings:
bo <- browse_eco_opening(subset(df,grepl("Kasparov",White)),20)



