library(rrBlupMethod6)


### Name: rrBlupRotation
### Title: rrBlupRotation - linear transformation for the adjusted means
###   and the design matrices
### Aliases: rrBlupRotation

### ** Examples


## simulate a small data set (250 observations, 300 markers)
set.seed(3421475)
N <- 250
M <- 300

Z <- matrix(sample(c(1,-1),N * M, replace = TRUE),
            nrow = N,
            ncol = M)

## marker effects
u <- rnorm(M, 0, sqrt(1/M))

sig2e <- 1
y <- Z %*% u + rnorm(N,0,sqrt(sig2e))

## simulate a random variance-covariance structure of the adjusted means
## (Note that this is just for demonstration purposes, the values are
## non-sensical!)
R <- matrix(rnorm(N*N),N,N) 
diag(R) <- abs(diag(R))
R <- R + t(R)


## rotate
out_r <- rrBlupRotation(y, Z = Z, R = R)

## use rotated y,X and Z for computing marker effects and set sig2e = 1
out_RRBLUP_m6_r <- rrBlupM6(y = out_r$y_tilda,
                            X = out_r$X_tilda,
                            Z = out_r$Z_tilda,
                            sig2e = 1,
                            chunks = 4)



