library(aster)


### Name: chamae2
### Title: Life History Data on Chamaecrista fasciculata
### Aliases: chamae2
### Keywords: datasets

### ** Examples

data(chamae2)
### wide version
chamae2w <- reshape(chamae2, direction = "wide", timevar = "varb",
    v.names = "resp", varying = list(levels(chamae2$varb)))



