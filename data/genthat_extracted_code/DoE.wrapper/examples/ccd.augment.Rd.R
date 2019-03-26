library(DoE.wrapper)


### Name: ccd.augment
### Title: Function for augmenting an existing cube with a star portion,
###   using package rsm
### Aliases: ccd.augment
### Keywords: array design

### ** Examples

  ## purely technical examples for the sequential design creation process
    ## start with a fractional factorial with center points
    plan <- FrF2(16,5,default.levels=c(10,30),ncenter=6)
    ## collect data and add them to the design
    y <- rexp(22)
    plan <- add.response(plan,y)
    ## assuming that an analysis has created the suspicion that a second order 
    ## model should be fitted (not to be expected for the above random numbers):
    plan.augmented <- ccd.augment(plan, ncenter=4)
    ## add new responses to the design
    y <- c(y, rexp(14))  ## append responses for the 14=5*2 + 4 star points
    r.plan.augmented <- add.response(plan.augmented, y, replace=TRUE)

  ## for info: how to analyse results from such a desgin
    lm.result <- lm(y~Block.ccd+(.-Block.ccd)^2+I(A^2)+I(B^2)+I(C^2)+I(D^2)+I(E^2), 
                      r.plan.augmented)
    summary(lm.result)
    ## analysis with function rsm
    rsm.result <- rsm(y~Block.ccd+SO(A,B,C,D,E), r.plan.augmented)
    summary(rsm.result)  ## provides more information than lm.result
    loftest(rsm.result)  ## separate lack of fit test
    ## graphical analysis 
    ## (NOTE: purely for demo purposes, the model is meaningless here)
    ## individual contour plot
    contour(rsm.result,B~A)
    ## several contour plots
    par(mfrow=c(1,2))
    contour(rsm.result,list(B~A, C~E))
    ## many contourplots, all pairs of some factors
    par(mfrow=c(2,3))
    contour(rsm.result,~A+B+C+D)



