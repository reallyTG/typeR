library(aplpack)


### Name: slider.hist
### Title: interactive histogram and density traces
### Aliases: slider.hist slider.density
### Keywords: univar iplot

### ** Examples

## Not run: 
##D ## This example cannot be run by examples() but should be work in an interactive R session
##D   slider.hist(log(islands))
## End(Not run)
## Not run: 
##D ## This example cannot be run by examples() but should be work in an interactive R session
##D slider.density(rivers,xlab="rivers",col="red")
## End(Not run)
## Not run: 
##D ## This example cannot be run by examples() but should be work in an interactive R session
##D slider.density(log(rivers),xlab="rivers",col="red",
##D   panel=function(x){
##D     xx<-seq(min(x),max(x),length=100)
##D     yy<-dnorm(xx,mean(x),sd(x))
##D     lines(xx,yy)
##D     rug(x)
##D     print(summary(yy))
##D   }
##D )
## End(Not run)



