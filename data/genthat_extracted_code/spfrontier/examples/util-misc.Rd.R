library(spfrontier)


### Name: genW
### Title: Standard spatial contiguity matrixes
### Aliases: constructW genW rowStdrt
### Keywords: frontier spatial stochastic

### ** Examples

# Completely filled 10x10 rook contiguity matrix
rookW <- genW(100)
rookW

# Partly filled 10x10 rook contiguity matrix
rookW <- genW(90)
rookW

# Completely filled 10x10 queen contiguity matrix
queenW <- genW(100, type="queen")
queenW

# Completely filled 10x10 queen contiguity matrix
queenW <- genW(100, type="queen")
queenW

# Standartisation
stQueenW <- rowStdrt(queenW)
stQueenW


data(airports)

W <- constructW(cbind(airports$lon, airports$lat),airports$ICAO_code)




