library(CRTgeeDR)


### Name: geeDREstimation
### Title: Doubly Robust Inverse Probability Weighted Augmented GEE
###   Estimator
### Aliases: geeDREstimation

### ** Examples

data(data.sim)
 ## Not run: 
##D  #### STANDARD GEE
##D  geeresults<-geeDREstimation(formula=OUTCOME~TRT,
##D                                id="CLUSTER" , data = data.sim,
##D                                family = "binomial", corstr = "independence")
##D  summary(geeresults)
##D  #### IPW GEE
##D  ipwresults<-geeDREstimation(formula=OUTCOME~TRT,
##D                                id="CLUSTER" , data = data.sim,
##D                                family = "binomial", corstr = "independence",
##D                                model.weights=I(MISSING==0)~TRT*AGE)
##D  summary(ipwresults)
##D  #### AUGMENTED GEE
##D  augresults<-geeDREstimation(formula=OUTCOME~TRT,
##D                                id="CLUSTER" , data = data.sim,
##D                                family = "binomial", corstr = "independence",
##D                                model.augmentation.trt=OUTCOME~AGE,
##D                                model.augmentation.ctrl=OUTCOME~AGE, stepwise.augmentation=FALSE)
##D  summary(augresults)
##D  
## End(Not run)
 #### DOUBLY ROBUST
 drresults<-geeDREstimation(formula=OUTCOME~TRT,
                               id="CLUSTER" , data = data.sim,
                               family = "binomial", corstr = "independence",
                               model.weights=I(MISSING==0)~TRT*AGE,
                               model.augmentation.trt=OUTCOME~AGE,
                               model.augmentation.ctrl=OUTCOME~AGE, stepwise.augmentation=FALSE)
 summary(drresults)



