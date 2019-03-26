library(fts)


### Name: expanding
### Title: Expanding Window Functions
### Aliases: expanding expanding.mean expanding.sum expanding.product
###   expanding.max expanding.min expanding.sd expanding.rank expanding.cor
###   expanding.cov
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),data=rnorm(100))

x.emax <- expanding.max(x)
x.emin <- expanding.min(x)



