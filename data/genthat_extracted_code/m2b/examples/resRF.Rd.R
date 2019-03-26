library(m2b)


### Name: resRF
### Title: Random forest model outputs for a xytb object
### Aliases: resRF

### ** Examples

## Not run: 
##D  
##D #track_CAGA_005 is dataset
##D #generate a complete xytb object with derived (over moving windows of 3, 5
##D #and 9 points, with quantile at 0, 50 and 100%) and shifted information on 10
##D #and 100 points
##D xytb<-xytb(track_CAGA_005,"a track",c(3,5,9),c(0,.5,1),c(10,100))
##D #compute a random forest model to predict behaviour (b, where -1 is
##D #unobserved behaviour) using the derived
##D #parameters ("actual")
##D xytb<-modelRF(xytb,"actual",nob="-1",colin=TRUE,varkeep=c("v","thetarel"),
##D zerovar=TRUE,rfcv=TRUE,step=.9)
##D #modelling results
##D resRF(xytb,type="rf")
##D resRF(xytb,type="importance")
##D resRF(xytb,type="rfcv")
##D resRF(xytb,type="confusion")
## End(Not run)



