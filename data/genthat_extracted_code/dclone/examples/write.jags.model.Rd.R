library(dclone)


### Name: write.jags.model
### Title: Write and remove model file
### Aliases: write.jags.model clean.jags.model custommodel
### Keywords: IO

### ** Examples

## Not run: 
##D ## simple regression example from the JAGS manual
##D jfun <- function() {
##D     for (i in 1:N) {
##D         Y[i] ~ dnorm(mu[i], tau)
##D         mu[i] <- alpha + beta * (x[i] - x.bar)
##D     }
##D     x.bar <- mean(x)
##D     alpha ~ dnorm(0.0, 1.0E-4)
##D     beta ~ dnorm(0.0, 1.0E-4)
##D     sigma <- 1.0/sqrt(tau)
##D     tau ~ dgamma(1.0E-3, 1.0E-3)
##D }
##D ## data generation
##D set.seed(1234)
##D N <- 100
##D alpha <- 1
##D beta <- -1
##D sigma <- 0.5
##D x <- runif(N)
##D linpred <- crossprod(t(model.matrix(~x)), c(alpha, beta))
##D Y <- rnorm(N, mean = linpred, sd = sigma)
##D ## list of data for the model
##D jdata <- list(N = N, Y = Y, x = x)
##D ## what to monitor
##D jpara <- c("alpha", "beta", "sigma")
##D ## write model onto hard drive
##D jmodnam <- write.jags.model(jfun)
##D ## fit the model
##D regmod <- jags.fit(jdata, jpara, jmodnam, n.chains = 3)
##D ## cleanup
##D clean.jags.model(jmodnam)
##D ## model summary
##D summary(regmod)
## End(Not run)
## let's customize this model
jfun2 <- structure(
    c(" model { ",
    "     for (i in 1:n) { ",
    "         Y[i] ~ dpois(lambda[i]) ",
    "         Y[i] <- alpha[i] + inprod(X[i,], beta[1,]) ",
    "         log(lambda[i]) <- alpha[i] + inprod(X[i,], beta[1,]) ",
    "         alpha[i] ~ dnorm(0, 1/sigma^2) ",
    "     } ",
    "     for (j in 1:np) { ",
    "         beta[1,j] ~ dnorm(0, 0.001) ",
    "     } ",
    "     sigma ~ dlnorm(0, 0.001) ",
    " } "),
    class = "custommodel")
custommodel(jfun2)
## GLMM
custommodel(jfun2, 4)
## LM
custommodel(jfun2, c(3,5))
## deparse when print
print(custommodel(jfun2), deparse=TRUE)



