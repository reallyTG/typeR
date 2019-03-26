library(gustave)


### Name: varDT
### Title: Variance approximation with Deville-Tillé (2005) formula
### Aliases: varDT var_srs

### ** Examples

library(sampling)
set.seed(1)

# Simple random sampling case
N <- 1000
n <- 100
y <- rnorm(N)[as.logical(srswor(n, N))]
pik <- rep(n/N, n)
varDT(y, pik)
sampling::varest(y, pik = pik)
N^2 * (1 - n/N) * var(y) / n

# Unequal probability sampling case
N <- 1000
n <- 100
pik <- runif(N)
s <- as.logical(UPsystematic(pik))
y <- rnorm(N)[s]
pik <- pik[s]
varDT(y, pik)
varest(y, pik = pik)
# The small difference is expected (see Details).

# Balanced sampling case
N <- 1000
n <- 100
pik <- runif(N)
x <- matrix(rnorm(N*3), ncol = 3)
s <- as.logical(samplecube(x, pik))
y <- rnorm(N)[s]
pik <- pik[s]
x <- x[s, ]
varDT(y, pik, x)

# Balanced sampling case (variable of interest
# among the balancing variables)
N <- 1000
n <- 100
pik <- runif(N)
y <- rnorm(N)
x <- cbind(matrix(rnorm(N*3), ncol = 3), y)
s <- as.logical(samplecube(x, pik))
y <- y[s]
pik <- pik[s]
x <- x[s, ]
varDT(y, pik, x)
# As expected, the total of the variable of interest is perfectly estimated.

# strata argument
n <- 100
H <- 2
pik <- runif(n)
y <- rnorm(n)
strata <- letters[sample.int(H, n, replace = TRUE)]
all.equal(
 varDT(y, pik, strata = strata),
 varDT(y[strata == "a"], pik[strata == "a"]) + varDT(y[strata == "b"], pik[strata == "b"])
)

# precalc argument
n <- 1000
H <- 50
pik <- runif(n)
y <- rnorm(n)
strata <- sample.int(H, n, replace = TRUE)
precalc <- varDT(y = NULL, pik, strata = strata)
identical(
 varDT(y, precalc = precalc),
 varDT(y, pik, strata = strata)
)




