library(genasis)


### Name: genanaggr
### Title: Computes annual aggregations from (relevant) POPs concentration
###   data
### Aliases: genanaggr
### Keywords: genanaggr

### ** Examples

## Vector input.
genanaggr(c(0.123,0.158,0.087,0.252,0.211,0.154),
          c("2012-01-10","2012-08-17","2012-12-12",
            "2013-04-09","2013-08-08","2013-12-10"),
          minn=3)

## Use of example data from the package:
data(kosetice.pas.genasis)
genanaggr(kosetice.pas.genasis,input="genasis",show.flagged=TRUE)
data(kosetice.act.openair)
genanaggr(genoutlier(kosetice.act.openair[1:6],
          plot=FALSE)$res,minn=6,gap=1.5)



