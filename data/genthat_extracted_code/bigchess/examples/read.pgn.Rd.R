library(bigchess)


### Name: read.pgn
### Title: Reads PGN files into data frame
### Aliases: read.pgn

### ** Examples

f <- system.file("extdata", "2016_Candidates.pgn", package = "bigchess")
df <- read.pgn(f)
# ...successfully imported 56 games...
## No test: 
# Example downloaded from https://www.pgnmentor.com/files.html#players and gzipped:
f <- system.file("extdata", "Carlsen.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE)
# Fastest mode:
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,n.moves = FALSE,extract.moves = FALSE,
stat.moves = FALSE, ignore.other.games = FALSE)
# Parse additional tags and extract all moves:
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,add.tags = c("WhiteElo", "BlackElo", "ECO"),extract.moves = -1)
# Example of direct downloading data from chess.com using API:
df <- read.pgn("https://api.chess.com/pub/player/fabianocaruana/games/2013/03/pgn")
# Warning of incomplete line could appear
## End(No test)
## No test: 
# Example of scraping all of games given user:
user <- "fabianocaruana"
library("rjson")
json_file <- paste0("https://api.chess.com/pub/player/",user,"/games/archives")
json_data <- fromJSON(paste(readLines(json_file), collapse=""))
result <- data.frame()
for(i in json_data$archives)
result <- rbind(result,read.pgn(paste0(i,"/pgn")))
## End(No test)



