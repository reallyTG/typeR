library(clere)


### Name: fitClere
### Title: fitClere function
### Aliases: fitClere
### Keywords: fitClere Clere clere function

### ** Examples

# library(clere)
plotit    <- FALSE
sparse    <- FALSE
nItEM     <- 100
nBurn     <- nItEM / 2
nsamp     <- 100
analysis  <- "fit"
algorithm <- "SEM"
nItMC     <- 1
dp        <- 2
maxit     <- 200
tol       <- 1e-3

n         <- 50
p         <- 50
intercept <- 0
sigma     <- 10
gamma     <- 10
rho       <- 0.5

g         <- 5 
probs     <- c(0.36, 0.28, 0.20, 0.12, 0.04)
Eff       <- p * probs
a         <- 5
B         <- a**(0:(g-1))-1
Z         <- matrix(0, nrow = p, ncol = g)
imax      <- 0
imin      <- 1

for (k in 1:g) {
    imin <- imax+1
    imax <- imax+Eff[k]
    Z[imin:imax, k] <- 1
}
Z <- Z[sample(1:p, p), ]
if (g>1) {
    Beta <- rnorm(p, mean = c(Z%*%B), sd = gamma)
} else {
    Beta <- rnorm(p, mean = B, sd = gamma)
}

theta0 <- NULL # c(intercept, B, probs, sigma^2, gamma^2)
Z0     <- NULL # apply(Z, 1, which.max)-1

gmax <- 7

## Prediction
eps  <- rnorm(n, mean = 0, sd = sigma)
X    <- matrix(rnorm(n*p), nrow = n, ncol = p)
Y    <- as.numeric(intercept+X%*%Beta+eps)
tt   <- system.time(mod <- fitClere(y = Y, x = X, g = gmax, 
                        analysis = analysis,algorithm = algorithm,
                        plotit = plotit, 
                        sparse = FALSE,nItEM = nItEM, 
                        nBurn = nBurn, nItMC = nItMC, 
                        nsamp = nsamp, theta0 = theta0, Z0 = Z0) )
plot(mod)
Yv <- predict(object = mod, newx = X)



