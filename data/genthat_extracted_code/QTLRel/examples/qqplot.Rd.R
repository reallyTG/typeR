library(QTLRel)


### Name: qqPlot
### Title: Quantile-Quantile Plots
### Aliases: qqPlot

### ** Examples

## Not run: 
##D par(mfrow=c(1,2))
##D x<- rnorm(200, mean=0.7,sd=2); y<- rnorm(200, sd=2)
##D qqPlot(y,x,qqline="exp")
##D qqPlot(y=y,x="norm",sd=2)
##D ks.test(x,y)
## End(Not run)



