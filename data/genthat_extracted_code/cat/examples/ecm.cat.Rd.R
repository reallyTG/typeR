library(cat)


### Name: ecm.cat
### Title: ECM algorithm for incomplete categorical data
### Aliases: ecm.cat
### Keywords: models

### ** Examples

data(older)                           # load data
#
#  Example 1
#
older[1:2,]                           # see partial content; older.frame also
                                      # available.
s <- prelim.cat(older[,-7],older[,7]) # preliminary manipulations
m <- c(1,2,5,6,0,3,4)                 # margins for restricted model
try(thetahat1 <- ecm.cat(s,margins=m))# will complain 
thetahat2 <- ecm.cat(s,margins=m,prior=1.1)
                                      # same model with prior information
logpost.cat(s,thetahat2)              # loglikelihood under thetahat2
#
#  Example 2   (reproduces analysis performed in Schafer's p. 327.)
#
m1 <- c(1,2,3,5,6,0,1,2,4,5,6,0,3,4)  # model (ASPMG)(ASPMD)(GD) in
                                      # Schafer's p. 327
theta1 <- ecm.cat(s,margins=m1,
                       prior=1.1)     # Prior to bring MLE away from boundary.
m2     <- c(1,2,3,5,6,0,1,2,4,5,6)    # model (ASPMG)(ASPMD)
theta2 <- ecm.cat(s,margins=m2,
                       prior=1.1)
lik1   <- logpost.cat(s,theta1)       # posterior log likelihood.
lik2   <- logpost.cat(s,theta2)       # id. for restricted model.
lrt    <- -2*(lik2-lik1)              # for testing significance of (GD)
p      <- 1 - pchisq(lrt,1)           # significance level
cat("LRT statistic for \n(ASMPG)(ASMPD) vs. (ASMPG)(ASMPD)(GD): ",lrt," with p-value = ",p)



