library(AnnuityRIR)


### Name: triangular_parameters
### Title: Compute the parameters and plot the fitted triangular
###   distribution of the random variable X.
### Aliases: triangular_parameters

### ** Examples


# example 1
data=c(0.00,-0.05,-0.05,-0.06,-0.06,0.02,-0.06,-0.05,-0.04,-0.05,
-0.03,-0.06,0.04,-0.05,-0.08,-0.05,-0.12,-0.03,-0.05,-0.04,-0.06)
triangular_parameters(data)

# example 2
data<-rnorm(n=200,m=0.75,sd=0.2)
triangular_parameters(data)


# example 3
data = c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
triangular_parameters(data)




