library(bigchess)


### Name: read.pgn.ff
### Title: Reads PGN files into ff data frame
### Aliases: read.pgn.ff

### ** Examples

require(ff)
require(ffbase)
f <- system.file("extdata", "Carlsen.gz", package = "bigchess")
con <- gzfile(f,"rbt",encoding = "latin1")
# options("fftempdir"="/path/"...) # if necessarily
fdf <- read.pgn.ff(con,stat.moves = FALSE)
delete(fdf)
# Works with all types of connections (also gz or zip files).
# con argument is passed directly to readLines(con,batch.size)
# so (if total number of lines to read is greater then batch.size)
# depending on platform use it correctly:
## No test: 
# Windows ('rb' opening mode for loop over readLines):
con <- gzfile(system.file("extdata", "Carlsen.gz", package = "bigchess"),"rb",encoding = "latin1")
# con <- file("path_to_big_chess_file.pgn","rb",encoding = "latin1")
fdf <- read.pgn.ff(con)
delete(fdf)
## End(No test)
## No test: 
# Linux ('r' opening mode for loop over readLines):
con <- gzfile(system.file("extdata", "Carlsen.gz", package = "bigchess"),"r",encoding = "latin1")
# con <- file("path_to_big_chess_file.pgn","r",encoding = "latin1")
fdf <- read.pgn.ff(con)
delete(fdf)
## End(No test)



