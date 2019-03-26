library(MRFA)


### Name: predict.MRFA
### Title: Prediction of Multi-Resolution Functional ANOVA (MRFA) Model
### Aliases: predict.MRFA

### ** Examples

## Not run: 
##D 
##D #####             Testing function: OTL circuit function                     #####
##D #####  Thanks to Sonja Surjanovic and Derek Bingham, Simon Fraser University #####
##D otlcircuit <- function(xx)
##D {
##D   Rb1  <- 50   + xx[1] * 100
##D   Rb2  <- 25   + xx[2] * 45
##D   Rf   <- 0.5  + xx[3] * 2.5
##D   Rc1  <- 1.2  + xx[4] * 1.3
##D   Rc2  <- 0.25 + xx[5] * 0.95
##D   beta <- 50   + xx[6] * 250
##D 
##D   Vb1 <- 12*Rb2 / (Rb1+Rb2)
##D   term1a <- (Vb1+0.74) * beta * (Rc2+9)
##D   term1b <- beta*(Rc2+9) + Rf
##D   term1 <- term1a / term1b
##D 
##D   term2a <- 11.35 * Rf
##D   term2b <- beta*(Rc2+9) + Rf
##D   term2 <- term2a / term2b
##D 
##D   term3a <- 0.74 * Rf * beta * (Rc2+9)
##D   term3b <- (beta*(Rc2+9)+Rf) * Rc1
##D   term3 <- term3a / term3b
##D 
##D   Vm <- term1 + term2 + term3
##D   return(Vm)
##D }
##D 
##D library(MRFA)
##D #####   Training data and testing data   #####
##D set.seed(2)
##D n <- 1000; n_new <- 100; d <- 6
##D X.train <- matrix(runif(d*n), ncol = d)
##D Y.train <- apply(X.train, 1, otlcircuit)
##D X.test <- matrix(runif(d*n_new), ncol = d)
##D Y.test <- apply(X.test, 1, otlcircuit)
##D 
##D #####   Fitting    #####
##D MRFA_model <- MRFA_fit(X.train, Y.train, verbose = TRUE)
##D 
##D #####   Prediction   ######
##D Y.pred <- predict(MRFA_model, X.test, lambda = min(MRFA_model$lambda))$y_hat
##D print(sqrt(mean((Y.test - Y.pred)^2)))
## End(Not run)



