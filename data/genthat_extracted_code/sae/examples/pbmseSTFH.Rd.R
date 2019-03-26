library(sae)


### Name: pbmseSTFH
### Title: Parametric bootstrap mean squared error estimator of a
###   spatio-temporal Fay-Herriot model.
### Aliases: pbmseSTFH
### Keywords: method

### ** Examples

data(spacetime)      # Load data set 
data(spacetimeprox)  # Load proximity matrix 

D <- nrow(spacetimeprox)            # number of domains
T <- length(unique(spacetime$Time)) # number of time instant

# Calculate MSEs of EBLUPs under the spatio-temporal Fay-Herriot model
# with uncorrelated time effects nested within domains (model S)
set.seed(123)
resultS <- pbmseSTFH(Y ~ X1 + X2, D, T, Var, spacetimeprox, B=10, 
                     model="S", data=spacetime)

# Print direct estimates, variance, "S" model estimates, mse and 
# residuals of the last time instant.
output <- data.frame(Domain=spacetime$Area, Period=spacetime$Time, 
                     Direct=spacetime$Y, EBLUP_S=resultS$est$eblup, 
                     VarDirect=spacetime$Var, MSE_S=resultS$mse, 
                     Residuals=spacetime$Y-resultS$est$eblup) 
periods <- unique(spacetime$Time)                  
lastperiod <- periods[length(periods)]   
print(output[output[,"Period"]==lastperiod,], row.names=FALSE)


# Calculate MSEs of the EBLUPs based on the spatio-temporal Fay-Herriot model
# with AR(1) time effects nested within each area
attach(spacetime)
set.seed(123)
resultST <- pbmseSTFH(Y ~ X1 + X2, D, T, vardir=Var, spacetimeprox, B=10)  

# Print direct estimates, variance, "ST" model estimates, mse and 
# residuals of the last time instant.
output <- data.frame(Domain=Area, Period=Time, Direct=Y, 
                     EBLUP_ST=resultST$est$eblup, VarDirect=Var, 
                     MSE_ST=resultST$mse, 
                     Residuals=Y-resultST$est$eblup) 
periods <- unique(Time)                  
lastperiod <- periods[length(periods)]                     
print(output[output[,"Period"]==lastperiod,], row.names=FALSE)

detach(spacetime)



