library(AnnuityRIR)


### Name: beta_parameters
### Title: Compute the parameters of the beta distribution and plot
###   normalized data.
### Aliases: beta_parameters

### ** Examples


# example 1
data=c(0.00,-0.05,-0.05,-0.06,-0.06,0.02,-0.06,-0.05,-0.04,-0.05,
-0.03,-0.06,0.04,-0.05,-0.08,-0.05,-0.12,-0.03,-0.05,-0.04,-0.06)
beta_parameters(data)

# example 2
data<-rnorm(n=200,m=0.075,sd=0.2)
beta_parameters(data)





