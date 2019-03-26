library(R2OpenBUGS)


### Name: write.model
### Title: Creating a OpenBUGS model file
### Aliases: write.model
### Keywords: IO file

### ** Examples

## Same "schoolsmodel" that is used in the examples in ?bugs:
schoolsmodel <- function(){
    for (j in 1:J){
        y[j] ~ dnorm (theta[j], tau.y[j])
        theta[j] ~ dnorm (mu.theta, tau.theta)
        tau.y[j] <- pow(sigma.y[j], -2)
    }
    mu.theta ~ dnorm (0.0, 1.0E-6)
    tau.theta <- pow(sigma.theta, -2)
    sigma.theta ~ dunif (0, 1000)
}

    ## some temporary filename:
    filename <- file.path(tempdir(), "schoolsmodel.bug")

## write model file:
write.model(schoolsmodel, filename)
## and let's take a look:
file.show(filename)



