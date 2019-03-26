library(crmPack)


### Name: Samples-class
### Title: Class for the MCMC output
### Aliases: Samples-class .Samples
### Keywords: classes

### ** Examples


# Saving the mcmc options which were used to generate the samples
options <- McmcOptions(burnin=10000,
                       step=2,
                       samples=10000)

# Create an object of class 'Samples'
# Here the parameters 'alpha' and 'beta' are randomly generated. Of coure in 
# a real example these would come as an output from mcmc procedures
samples <- Samples(data=list(alpha=rnorm(10000),beta=rnorm(10000)),
                   options=options)




