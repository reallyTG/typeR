library(SuppDists)


### Name: maxFratio
### Title: The maximum F-ratio distribution
### Aliases: maxFratio dmaxFratio pmaxFratio qmaxFratio rmaxFratio
###   smaxFratio
### Keywords: distribution

### ** Examples


pmaxFratio(4, 10, 10)
pmaxFratio(c(2.3, 4, 8.5), 10, 10)	## approximately 5% 50% and 95% 
qmaxFratio(p=.95,df=c(10,20), k=10)
smaxFratio(10, 10) ## Wait for this, it may take a while
plot(function(x)dmaxFratio(x, 10, 10),1,10)




