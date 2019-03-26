library(Rpdb)


### Name: toSymbols
### Title: Atomic Symbols Converter
### Aliases: toSymbols toSymbols.character toSymbols.integer
###   toSymbols.numeric
### Keywords: manip

### ** Examples

x <- c(1:10)
toSymbols(x)

x <- c("C  "," o","h1","1h","UU","SI0","cR")
toSymbols(x)

# 'nletters' can be used to truncate the character strings before convertion, if need
toSymbols("SIL", nletters=3) # return NA
toSymbols("SIL", nletters=2) # return "Si"
toSymbols("SIL", nletters=1) # return "S"




