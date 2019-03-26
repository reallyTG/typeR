library(grr)


### Name: convertBase
### Title: Convert string representations of numbers in any base to any
###   other base.
### Aliases: convertBase

### ** Examples


identical(convertBase(1234,base2=8),as.character(as.octmode(1234)))

convertBase(17771,base1=8,base2=30)
convertBase(17771,base1=8,base2=10)
convertBase(8185,base1=10,base2=30)




