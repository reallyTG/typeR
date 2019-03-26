library(sirt)


### Name: linking.robust
### Title: Robust Linking of Item Intercepts
### Aliases: linking.robust summary.linking.robust plot.linking.robust
### Keywords: Linking Robust linking summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: Linking data.si03
#############################################################################

data(data.si03)
res1 <- sirt::linking.robust( itempars=data.si03 )
summary(res1)
  ##   Number of items=27
  ##   Optimal trimming parameter k=8 |  non-robust parameter k=0
  ##   Linking constant=-0.0345 |  non-robust estimate=-0.056
  ##   Standard error=0.0186 |  non-robust estimate=0.027
  ##   DIF SD: MAD=0.0771 (robust) | SD=0.1405 (non-robust)
plot(res1)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Linking PISA item parameters data.pisaPars
##D #############################################################################
##D 
##D data(data.pisaPars)
##D 
##D # Linking with items
##D res2 <- sirt::linking.robust( data.pisaPars[, c(1,3,4)] )
##D summary(res2)
##D   ##   Optimal trimming parameter k=0 |  non-robust parameter k=0
##D   ##   Linking constant=-0.0883 |  non-robust estimate=-0.0883
##D   ##   Standard error=0.0297 |  non-robust estimate=0.0297
##D   ##   DIF SD: MAD=0.1824 (robust) | SD=0.1487 (non-robust)
##D ##  -> no trimming is necessary for reducing the standard error
##D plot(res2)
##D 
##D #############################################################################
##D # EXAMPLE 3: Linking with simulated item parameters containing outliers
##D #############################################################################
##D 
##D # simulate some parameters
##D I <- 38
##D set.seed(18785)
##D itempars <- data.frame("item"=paste0("I",1:I) )
##D itempars$study1 <- stats::rnorm( I, mean=.3, sd=1.4 )
##D # simulate DIF effects plus some outliers
##D bdif <- stats::rnorm(I,mean=.4,sd=.09)+( stats::runif(I)>.9 )* rep( 1*c(-1,1)+.4, each=I/2 )
##D itempars$study2 <- itempars$study1 + bdif
##D 
##D # robust linking
##D res <- sirt::linking.robust( itempars )
##D summary(res)
##D   ##   Number of items=38
##D   ##   Optimal trimming parameter k=12 |  non-robust parameter k=0
##D   ##   Linking constant=-0.4285 |  non-robust estimate=-0.5727
##D   ##   Standard error=0.0218 |  non-robust estimate=0.0913
##D   ##   DIF SD: MAD=0.1186 (robust) | SD=0.5628 (non-robust)
##D ## -> substantial differences of estimated linking constants in this case of
##D ##    deviations from normality of item parameters
##D plot(res)
## End(Not run)



