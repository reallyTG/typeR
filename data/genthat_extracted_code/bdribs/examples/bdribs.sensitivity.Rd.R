library(bdribs)


### Name: bdribs.sensitivity
### Title: sensitivity plot - plot of range of posterior probability
###   corresponding to a range of background rate
### Aliases: bdribs.sensitivity

### ** Examples

## Sample calls
     #run 1: The sensitivity plot
     bdribs.sensitivity(Y=5:9,pyr=800,k=1, tol=1.2, bg.evnt=18, bg.pyr=4000,bg.ci.coef=0.90)
     #run 2: The sensitivity plot
     bdribs.sensitivity(Y=5:9,pyr=800,k=1, tol=1.2, bg.evnt=18, bg.pyr=4000,bg.ci.coef=0.90,
     add.mid=TRUE)
     #run 3: Using bg.rng parameter
     bdribs.sensitivity(Y=5:9,pyr=800,k=1, tol=1.2, bg.rng = c(0.0030, 0.0045, 0.0065))



