library(Simpsons)


### Name: Simpsons-package
### Title: Detecting Simpson's Paradox
### Aliases: Simpsons-package
### Keywords: package

### ** Examples

## Not run: 
##D #example 1. Here, we want to regress 'Coffee' on 'Neuroticism', 
##D #taking into account possible gender differences. 
##D #Simulating 100 males 
##D coffeem=rnorm(100,100,15)
##D neuroticismm=(coffeem*.8)+rnorm(100,15,8)
##D clusterid=rep(1,100)
##D males=cbind(coffeem,neuroticismm,clusterid)
##D coffeef=rnorm(100,100,15)
##D neuroticismf=160+((coffeef*-.8)+rnorm(100,15,8))
##D clusterid=rep(2,100)
##D females=cbind(coffeef,neuroticismf,clusterid)
##D data=data.frame(rbind(males,females))
##D colnames(data) <- c("Coffee","Neuroticism","gender")
##D 
##D example1=Simpsons(Coffee,Neuroticism,clusterid=gender, data=data)
##D example1
##D 
## End(Not run)



