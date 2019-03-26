library(FrF2)


### Name: BsProb.design
### Title: Bayesian posterior probabilities from Box and Meyer method
### Aliases: BsProb.design
### Keywords: design

### ** Examples

   ### there are several success stories and recommendations for this method
   ### in the simulated example here (not fabricated, 
   ###         it was the first one that came to my mind), 
   ### the method goes wrong, at least when using mInt=2 (the default, because 
   ###         Daniel plots work quite well for pure main effects models):
   ### active factors are A to E (perhaps too many for the method to work),
   ### the method identifies F, J, and L with highest probability 
   ### (but is quite undecided)
   plan <- pb(12)
   dn <- desnum(plan)
   set.seed(8655)
   y <- dn%*%c(2,2,2,2,3,0,0,0,0,0,0) + dn[,1]*dn[,3]*2 - dn[,5]*dn[,4] + rnorm(12)/10
   plan.r <- add.response(plan, response=y)
   plot(bpmInt2 <- BsProb.design(plan.r), code=FALSE)
   plot(bpmInt1 <- BsProb.design(plan.r, mInt=1), code=FALSE) ## much better!
   summary(bpmInt2)
   summary(bpmInt1)
   ### For comparison: A Daniel plot does not show any significant effects according 
   ### to Lenths method, but makes the right effects stick out
   DanielPlot(plan.r, half=TRUE, alpha=1)



