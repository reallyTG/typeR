library(xpose4)


### Name: basic.gof
### Title: Basic goodness-of-fit plots, for Xpose 4
### Aliases: basic.gof

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

basic.gof(xpdb)

## Custom colours and symbols, IDs of individuals in study
basic.gof(xpdb, cex=0.6, pch=8, col=1, ids=TRUE)




