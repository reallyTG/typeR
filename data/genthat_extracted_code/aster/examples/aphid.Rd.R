library(aster)


### Name: aphid
### Title: Life History Data on Uroleucon rudbeckiae
### Aliases: aphid
### Keywords: datasets

### ** Examples

data(aphid)
### wide version
aphidw <- reshape(aphid, direction = "wide", timevar = "varb",
    v.names = "resp", varying = list(levels(aphid$varb)))



