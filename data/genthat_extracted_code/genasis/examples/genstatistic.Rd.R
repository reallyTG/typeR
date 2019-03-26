library(genasis)


### Name: genstatistic
### Title: Computes a set of statistics on input data
### Aliases: genstatistic
### Keywords: genstatistic

### ** Examples

## Vector input.
genstatistic(c(0.123,0.158,0.087,0.252,0.211,0.154),
             c("2012-01-10","2012-08-17","2012-12-12",
               "2013-04-09","2013-08-08","2013-12-10"),
             pollutant=c("pp-DDE"),by.years=TRUE)

## Use of example data from the package:
data(kosetice.pas.genasis)
genstatistic(kosetice.pas.genasis,input="genasis")
data(kosetice.pas.openair)
genstatistic(genpastoact(genoutlier(kosetice.pas.openair[,c(1:4,20:26)],
                         plot=FALSE)$res,method="auto"))



