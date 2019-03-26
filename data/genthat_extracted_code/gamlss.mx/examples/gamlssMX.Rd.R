library(gamlss.mx)


### Name: gamlssMX
### Title: Function to fit finite mixture of gamlss family distributions
### Aliases: gamlssMX gamlssMXfits
### Keywords: regression

### ** Examples

library(MASS)
data(geyser)
# fitting 2 finite normal mixtures 
m1<-gamlssMX(waiting~1,data=geyser,family=NO, K=2)
## Not run: 
##D #fitting 2 finite gamma mixtures 
##D m2<-gamlssMX(waiting~1,data=geyser,family=GA, K=2)
##D # fitting a model for pi
##D # first create a data frame
##D geyser1<-matrix(0,ncol=2, nrow=298)
##D geyser1[,1] <-geyser$waiting[-1]
##D geyser1[,2] <-geyser$duration[-299]
##D colnames(geyser1)<- c("waiting", "duration")
##D geyser1 <-data.frame(geyser1)
##D # get the best of 5 fits
##D m3<-gamlssMXfits(n=5, waiting~1, pi.formula=~duration, data=geyser1,family=NO, K=2)
##D m3
## End(Not run)



