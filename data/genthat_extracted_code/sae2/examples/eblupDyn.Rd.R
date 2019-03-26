library(sae2)


### Name: eblupDyn
### Title: EBLUP Fit of the Dynamic and Rao-Yu Time Series Models
### Aliases: eblupDyn eblupRY

### ** Examples

D <- 20 # number of domains
T <- 5 # number of years
set.seed(1)
data <- data.frame(Y= mvrnormSeries(D=D, T=T, rho.dyn=.9, sigma.v.dyn=1, 
   sigma.u.dyn=.19, sigma.e=diag(5)), X=rep(1:T, times=D))
result.dyn  <- eblupDyn(Y ~ X, D, T, vardir = diag(100), data=data)
result.dyn$fit

require(sae)
data(spacetime)      # Load data set from sae package
data(spacetimeprox)  # Load proximity matrix 

D <- nrow(spacetimeprox)            # number of domains
T <- length(unique(spacetime$Time)) # number of time instants
# Fit model ST with AR(1) time effects for each domain
resultST <- eblupSTFH(Y ~ X1 + X2, D, T, Var, spacetimeprox,
                      data=spacetime)
resultT  <- eblupDyn(Y ~ X1 + X2, D, T, vardir = diag(spacetime$Var),
                      data=spacetime, ids=spacetime$Area)
resultT.RY  <- eblupRY(Y ~ X1 + X2, D, T, vardir = diag(spacetime$Var),
                      data=spacetime, ids=spacetime$Area)
resultST$fit
resultT$fit
resultT.RY$fit
rowsT <- seq(T, T*D, by=T)
data.frame(Domain=spacetime$Area[rowsT], Y=spacetime$Y[rowsT], 
              EBLUP_ST=resultST$eblup[rowsT],
              EBLUB_Dyn=resultT$eblup[rowsT],
              EBLUP_RY=resultT.RY$eblup[rowsT])



