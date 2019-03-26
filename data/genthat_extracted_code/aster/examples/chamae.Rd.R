library(aster)


### Name: chamae
### Title: Life History Data on Chamaecrista fasciculata
### Aliases: chamae
### Keywords: datasets

### ** Examples

data(chamae)
### wide version
chamaew <- reshape(chamae, direction = "wide", timevar = "varb",
    v.names = "resp", varying = list(levels(chamae$varb)))



