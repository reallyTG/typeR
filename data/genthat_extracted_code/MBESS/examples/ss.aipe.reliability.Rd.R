library(MBESS)


### Name: ss.aipe.reliability
### Title: Sample Size Planning for Accuracy in Parameter Estimation for
###   Reliability Coefficients.
### Aliases: ss.aipe.reliability
### Keywords: design

### ** Examples

## Not run: 
##D ss.aipe.reliability (model='Parallel', type='Normal Theory', width=.1, i=6, 
##D                      cor.est=.3, psi.square=.2, conf.level=.95, assurance=NULL, initial.iter=500, 
##D                      final.iter=5000)
##D 
##D # Same as above but now 'assurance' is used. 
##D ss.aipe.reliability (model='Parallel', type='Normal Theory', width=.1, i=6, 
##D cor.est=.3, psi.square=.2, conf.level=.95, assurance=.85, initial.iter=500, 
##D final.iter=5000)
##D 
##D 
##D # Similar to the above but now the "True Score" model is used. Note how the psi.square changes 
##D # from a scalar to a vector of length i (number of items). 
##D # Also note, however, that cor.est is a single value (due to the true-score model specified)
##D ss.aipe.reliability (model='True Score', type='Normal Theory', width=.1, i=5, 
##D                      cor.est=.3, psi.square=c(.2, .3, .3, .2, .3), conf.level=.95, 
##D                      assurance=.85, initial.iter=500, final.iter=5000)
##D                      
##D ss.aipe.reliability (model='True Score', type='Normal Theory', width=.1, i=5, 
##D                      cor.est=.3, psi.square=c(.2, .3, .3, .2, .3), conf.level=.95, 
##D                      assurance=.85, initial.iter=500, final.iter=5000)                 
##D 
##D # Now, a congeneric model is used with the factor analytic appraoch. This is likely the 
##D # most realistic scenario (and maps onto the ideas of Coefficient Omega). 
##D ss.aipe.reliability (model='Congeneric', type='Factor Analytic', width=.1, i=5, 
##D lambda=c(.4, .4, .3, .3, .5), psi.square=c(.2, .4, .3, .3, .2), conf.level=.95, 
##D assurance=.85, initial.iter=1000, final.iter=5000)
##D 
##D # Now, the presumed population matrix among the items is used. 
##D Pop.Mat<-rbind(c(1.0000000, 0.3813850, 0.4216370, 0.3651484, 0.4472136), 
##D c(0.3813850, 1.0000000, 0.4020151, 0.3481553, 0.4264014), c(0.4216370, 
##D 0.4020151, 1.0000000, 0.3849002, 0.4714045), c(0.3651484, 0.3481553, 
##D 0.3849002, 1.0000000, 0.4082483), c(0.4472136, 0.4264014, 0.4714045, 
##D 0.4082483, 1.0000000))
##D 
##D ss.aipe.reliability (model='True Score', type='Normal Theory', width=.15, 
##D S=Pop.Mat, conf.level=.95, assurance=.85, initial.iter=1000, final.iter=5000) 
##D 
## End(Not run)



