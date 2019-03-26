library(mistr)


### Name: GNG_fit
### Title: Fitting a GPD-Normal-GPD Model
### Aliases: GNG_fit

### ** Examples

## Not run: 
##D  GNG_fit(stocks$SAP)
##D 
##D  GNG_fit(stocks$MSFT)
##D 
##D  autoplot(GNG_fit(stocks$ADS))
##D 
##D  GNG_fit(stocks$GSPC, start = c(break1=-0.0075, break2=0.0075, mean=0,
##D          sd=0.0115, shape1=0.15, shape2=0.15), control = list(maxit = 20000))
##D 
##D  GNG_fit(stocks$DJI, start = c(break1=-0.0055, break2=0.0055, mean=-0.001,
##D          sd=0.0055,shape1=0.15,shape2=0.15), method = "CG",control = list(maxit = 1000))
##D 
## End(Not run)



