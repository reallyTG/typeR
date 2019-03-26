library(FatTailsR)


### Name: laplacegaussnorm
### Title: Laplace-Gauss Normal Distribution Object
### Aliases: laplacegaussnorm

### ** Examples

    
prices2returns <- function(x) { 100*diff(log(x)) }
CAC  <- prices2returns(as.numeric(EuStockMarkets[,3])) 
lgn  <- laplacegaussnorm( CAC )
attributes(lgn)
head(lgn$dfrXPn)
head(lgn$dfrXLn)
head(lgn$dfrXDn)
lgn$coefn
lgn$dfrQnPn
lgn$dfrQnLn




