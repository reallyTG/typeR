library(memisc)


### Name: as.symbols
### Title: Construction of Lists of Symbols
### Aliases: as.symbols syms
### Keywords: programming

### ** Examples

  as.symbols(letters[1:8])
  syms("a",1:3,paste=TRUE)

  sapply(syms("a",1:3,paste=TRUE),typeof)



