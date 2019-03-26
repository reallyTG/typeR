library(abctools)


### Name: semiauto.abc
### Title: Performs semi-automatic ABC based on summary statistics
###   regression.
### Aliases: semiauto.abc
### Keywords: methods

### ** Examples


data(coal)
data(coalobs)

param<-coal[,2]
simstats<-coal[,4:6]

# use matrix below just in case to preserve dimensions.

obsstats<-matrix(coalobs[1,4:6],nrow=1)
obsparam<-matrix(coalobs[1,1])

# perform semi-automatic ABC with summary statistics defined by 
# X, X^2,X^3,X^4:
# other alternative specifications for this could be:
# list(function(x){ cbind(x,x^2,x^3,x^4) })
# list(as.function(alist(x=,cbind(x,x^2,x^3)))) etc

tmp<-semiauto.abc(obsstats, param, simstats,tol=.01,method="rejection",
satr=list(function(x){outer(x,Y=1:4,"^")}))

tmp$sa.info

# both these functions may be problematic: 

## Not run: 
##D  tmp<-semiauto.abc(obsstats, param, simstats,tol=.01,method="rejection",
##D satr=list(unique,sum))
## End(Not run)




