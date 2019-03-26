library(crimCV)


### Name: crimCV
### Title: Fits finite mixtures of Zero-inflated Poisson models
### Aliases: crimCV
### Keywords: Zero-inflated Poisson model Finite mixture model

### ** Examples

# Loads crimCV into the interpreter
library(crimCV)

# Load the "divide-and-round" TO1 dataset
data(TO1adj)
# Fit a 2 component ZIP(tau) model of degree 2.  Here the CVE is not
# calculated and only ~1/4 of the data is used so that the code will
# run quickly enough to satisfy CRAN's package policies.  To compute
# CVE run as:
# out1<-crimCV(TO1adj,2,dpolyp=2,rcv=TRUE)
subTO1adj<-TO1adj[1:100,]
out1<-crimCV(subTO1adj,2,dpolyp=2,init=5)
# Plot the component trajectories
plot(out1)
# Print out some useful output
summary(out1)



