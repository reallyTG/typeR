library(tmle)


### Name: tmleMSM
### Title: Targeted Maximum Likelihood Estimation of Parameter of MSM
### Aliases: tmleMSM

### ** Examples

library(tmle)
# Example 1. Estimating MSM parameter with correctly specified regression formulas
# MSM: psi0 + psi1*A + psi2*V + psi3*A*V  (saturated)
# true parameter value: psi = (0, 1, -2, 0.5) 
# generate data
  set.seed(100)
  n <- 1000
  W <- matrix(rnorm(n*3), ncol = 3)
  colnames(W) <- c("W1", "W2", "W3")
  V <- rbinom(n, 1, 0.5)
  A <- rbinom(n, 1, 0.5)
  Y <- rbinom(n, 1, plogis(A - 2*V + 0.5*A*V))
  result.ex1 <- tmleMSM(Y, A, W, V, MSM = "A*V", Qform = Y~., gform = A~1, 
                        hAVform = A~1, family = "binomial")
  print(result.ex1)

# Example 2. Repeated measures data, two observations per id
# (e.g., crossover study design)
# MSM: psi0 + psi1*A + psi2*V + psi3*V^2 + psi4*T
# true parameter value: psi = (-2, 1, 0, -2, 0 )
# generate data in wide format (id,  W1, Y(t),  W2(t), V(t), A(t)) 
   set.seed(100)
   n <- 500
   id <- rep(1:n)
   W1   <- rbinom(n, 1, 0.5)
   W2.1 <- rnorm(n)
   W2.2 <- rnorm(n)  
   V.1   <- rnorm(n)  
   V.2   <- rnorm(n)
   A.1 <- rbinom(n, 1, plogis(0.5 + 0.3 * W2.1))
   A.2 <- 1-A.1
   Y.1  <- -2 + A.1 - 2*V.1^2 + W2.1 + rnorm(n)
   Y.2  <- -2 + A.2 - 2*V.2^2 + W2.2 + rnorm(n)
   d <- data.frame(id, W1, W2=W2.1, W2.2, V=V.1, V.2, A=A.1, A.2, Y=Y.1, Y.2)

# change dataset from wide to long format
   longd <- reshape(d, 
          varying = cbind(c(3, 5, 7, 9), c(4, 6, 8, 10)),
          idvar = "id",
          direction = "long",
          timevar = "T",
          new.row.names = NULL,
          sep = "")
# misspecified model for initial Q, partial misspecification for g
   result.ex2 <- tmleMSM(Y = longd$Y, A = longd$A, W = longd[,c("W1", "W2")], V = longd$V, 
          T = longd$T, MSM = "A + V + I(V^2) + T", Qform = Y ~ A + V, gform = A ~ W2, id = longd$id)
   print(result.ex2)


# Example 3:  Introduce 20% missingness in example 2 data
  Delta <- rbinom(nrow(longd), 1, 0.8)
  result.ex3 <- tmleMSM(Y = longd$Y, A = longd$A, W = longd[,c("W1", "W2")], V = longd$V, T=longd$T,
          Delta = Delta, MSM = "A + V + I(V^2) + T", Qform = Y ~ A + V, gform = A ~ W2,
	  g.Deltaform = Delta~ 1, id=longd$id, verbose = TRUE)
  print(result.ex3)



