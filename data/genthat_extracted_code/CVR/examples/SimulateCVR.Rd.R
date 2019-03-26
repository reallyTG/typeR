library(CVR)


### Name: SimulateCVR
### Title: Generate simulation data.
### Aliases: SimulateCVR

### ** Examples

 set.seed(42)
 mydata <- SimulateCVR(family = "g", n = 100, rank = 4, p1 = 50, p2 = 70, 
                   pnz = 10, beta = c(2, 1, 0, 0))
 X1 <- mydata$X1
 X2 <- mydata$X2
 Xlist <- list(X1 = X1, X2 = X2); 
 Y <- mydata$y
 opts <- list(standardization = FALSE, maxIters = 300, tol = 0.005)
 ## use sparse CCA solution as initial values, see SparseCCA()
 Wini <- SparseCCA(X1, X2, 4, 0.7, 0.7) 
 ## perform CVR with fixed eta and lambda, see cvrsolver()
 fit <- cvrsolver(Y, Xlist, rank = 4, eta = 0.5, Lam = c(1, 1), 
                 family = "gaussian", Wini, penalty = "GL1", opts)
 ## check sparsity recovery
 fit$W[[1]]; 
 fit$W[[2]];
 ## check orthogonality
 X1W1 <- X1 %*% fit$W[[1]]; 
 t(X1W1) %*% X1W1



