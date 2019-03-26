library(BayesPiecewiseICAR)


### Name: ICARBHSampler
### Title: This function fits a piecewise hazard using a hierarchical model
###   with a ICAR dependence applied to the hazard heights
### Aliases: ICARBHSampler

### ** Examples

####This generates random survival data
 Y=rexp(100,1/20)
 I=rbinom(100,1,.5)
 ###Sets hyperparameters
 a1=.7
 b1=.7
 phi=3
 Jmax=20
 cl1=.25
 clam1=.5
 J1=3
 ###Combines the hyperparameters in to a vector
 hyper=c(a1,b1,phi,Jmax,cl1,J1,clam1)
 ###Set Number of iterations
 B=100
 ###Run the Sampler
 X=ICARBHSampler(Y,I,B,hyper)
 X




