library(sae)


### Name: eblupSTFH
### Title: EBLUPs based on a spatio-temporal Fay-Herriot model.
### Aliases: eblupSTFH
### Keywords: method

### ** Examples

data(spacetime)      # Load data set 
data(spacetimeprox)  # Load proximity matrix 

D <- nrow(spacetimeprox)            # number of domains
T <- length(unique(spacetime$Time)) # number of time instant

# Fit model S with uncorrelated time effects for each domain
resultS <- eblupSTFH(Y ~ X1 + X2, D, T, Var, spacetimeprox, "S",
                     theta_iter=TRUE, data=spacetime)
rowsT <- seq(T, T*D, by=T)
data.frame(Domain=spacetime$Area[rowsT], EBLUP_S=resultS$eblup[rowsT])
resultS$fit

# Fit model ST with AR(1) time effects for each domain
resultST <- eblupSTFH(Y ~ X1 + X2, D, T, Var, spacetimeprox,
                      theta_iter=TRUE, data=spacetime)
data.frame(Domain=spacetime$Area[rowsT], EBLUP_ST=resultS$eblup[rowsT])
resultST$fit



