library(mixpack)


### Name: rmixnorm
### Title: Random sample generated from an specified gaussian mixture
###   model.
### Aliases: rmixnorm

### ** Examples

Pi = c(0.5, 0.3, 0.2)
Mu = array(c(## Mu first component
             5, 5,
             ## Mu second component
             1, 1,
             ## Mu third component
             0, 0), dim = c(2,3))
S = array(c(## Sigma first component
            1, 0,
            0, 1,
            ## Sigma second component
            0.2, 0,
            0, 0.2,
            ## Sigma third component
            0.05, 0,
            0, 0.05), dim = c(2, 2, 3))
X = rmixnorm(100, Pi = Pi, Mu = Mu, S = S, labels = TRUE)
plot(X[,1:2], col=X[,3])



