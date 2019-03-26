library(CORE)


### Name: CORE
### Title: Cores of Recurrent Events
### Aliases: CORE

### ** Examples

#Compute 3 cores and perform no randomization 
#(meaningless for estimate of significance).
data(testInputCORE)
data(testInputBoundaries)
myCOREobj<-CORE(dataIn=testInputCORE,maxmark=3,nshuffle=0,
boundaries=testInputBoundaries,seedme=123)
## Not run: 
##D #Extend this computation to a much larger number of randomizations,
##D #using 2 cores of a host computer.
##D newCOREobj<-CORE(dataIn=myCOREobj,keep=c("maxmark","seedme","boundaries"),
##D nshuffle=20,distrib="Rparallel",njobs=2)
##D #When using "Grid", make sure you have write premission to the current 
##D #work space.
##D newCOREobj<-CORE(dataIn=myCOREobj,keep=c("maxmark","seedme","boundaries"),
##D nshuffle=20,distrib="Grid",njobs=2)
## End(Not run)



