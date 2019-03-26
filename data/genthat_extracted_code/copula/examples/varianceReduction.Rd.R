library(copula)


### Name: varianceReduction
### Title: Variance-Reduction Methods
### Aliases: rAntitheticVariates rLatinHypercube
### Keywords: distribution methods

### ** Examples

### 1 Basic plots ##############################################################

## Generate data from a Gumbel copula
cop <- gumbelCopula(iTau(gumbelCopula(), tau = 0.5))
n <- 1e4
set.seed(271)
U <- rCopula(n, copula = cop)

## Transform the sample to a Latin Hypercube sample
U.LH <- rLatinHypercube(U)

## Plot
## Note: The 'variance-reducing property' is barely visible, but that's okay
layout(rbind(1:2))
plot(U,    xlab = quote(U[1]), ylab = quote(U[2]), pch = ".", main = "U")
plot(U.LH, xlab = quote(U[1]), ylab = quote(U[2]), pch = ".", main = "U.LH")
layout(1) # reset layout

## Transform the sample to an Antithetic variate sample
U.AV <- rAntitheticVariates(U)
stopifnot(identical(U.AV[,,1],  U ),
          identical(U.AV[,,2], 1-U))

## Plot original sample and its corresponding (componentwise) antithetic variates
layout(rbind(1:2))
plot(U.AV[,,1], xlab = quote(U[1]), ylab = quote(U[2]), pch=".", main= "U")
plot(U.AV[,,2], xlab = quote(U[1]), ylab = quote(U[2]), pch=".", main= "1 - U")
layout(1) # reset layout


### 2 Small variance-reduction study for exceedance probabilities ##############

## Auxiliary function for approximately computing P(U_1 > u_1,..., U_d > u_d)
## by Monte Carlo simulation based on pseudo-random numbers, Latin hypercube
## sampling and quasi-random numbers.
sProb <- function(n, copula, u)
{
    d <- length(u)
    stopifnot(n >= 1, inherits(copula, "Copula"), 0 < u, u < 1,
              d == dim(copula))
    umat <- rep(u, each = n)
    ## Pseudo-random numbers
    U <- rCopula(n, copula = copula)
    PRNG <- mean(rowSums(U > umat) == d)
    ## Latin hypercube sampling (based on the recycled 'U')
    U. <- rLatinHypercube(U)
    LHS <- mean(rowSums(U. > umat) == d)
    ## Quasi-random numbers
    U.. <- cCopula(sobol(n, d = d, randomize = TRUE), copula = copula,
                   inverse = TRUE)
    QRNG <- mean(rowSums(U.. > umat) == d)
    ## Return
    c(PRNG = PRNG, LHS = LHS, QRNG = QRNG)
}

## Simulate the probabilities of falling in (u_1,1] x ... x (u_d,1]
library(qrng) # for quasi-random numbers
(Xtras <- copula:::doExtras()) # determine whether examples will be extra (long)
B <- if(Xtras)  500 else 100 # number of replications
n <- if(Xtras) 1000 else 200 # sample size
d <- 2 # dimension; note: for d > 2, the true value depends on the seed
nu <- 3 # degrees of freedom
th <- iTau(tCopula(df = nu), tau = 0.5) # correlation parameter
cop <- tCopula(param = th, dim = d, df = nu) # t copula
u <- rep(0.99, d) # lower-left endpoint of the considered cube
set.seed(42) # for reproducibility
true <- prob(cop, l = u, u = rep(1, d)) # true exceedance probability
system.time(res <- replicate(B, sProb(n, copula = cop, u = u)))

## "abbreviations":
PRNG <- res["PRNG",]
LHS  <- res["LHS" ,]
QRNG <- res["QRNG",]

## Compute the variance-reduction factors and % improvements
vrf  <- var(PRNG) / var(LHS)                    # variance reduction factor w.r.t. LHS
vrf. <- var(PRNG) / var(QRNG)                   # variance reduction factor w.r.t. QRNG
pim  <- (var(PRNG) - var(LHS)) / var(PRNG) *100 # improvement w.r.t. LHS
pim. <- (var(PRNG) - var(QRNG))/ var(PRNG) *100 # improvement w.r.t. QRNG

## Boxplot
boxplot(list(PRNG = PRNG, LHS = LHS, QRNG = QRNG), notch = TRUE,
        main = substitute("Simulated exceedance probabilities" ~
                              P(bold(U) > bold(u))~~ "for a" ~ t[nu.]~"copula",
                          list(nu. = nu)),
        sub = sprintf(
           "Variance-reduction factors and %% improvements: %.1f (%.0f%%), %.1f (%.0f%%)",
            vrf, pim, vrf., pim.))
abline(h = true, lty = 3) # true value
mtext(sprintf("B = %d replications with n = %d and d = %d", B, n, d), side = 3)



