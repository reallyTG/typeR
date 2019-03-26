library(qrng)


### Name: qrng
### Title: Compute Quasi-Random Sequences
### Aliases: korobov ghalton sobol
### Keywords: distribution

### ** Examples

n <- 1021 # prime
d <- 4 # dimension

## Korobov's sequence
generator <- 76 # see l'Ecuyer and Lemieux
u <- korobov(n, d = d, generator = generator)
pairs(u, gap = 0, pch = ".", labels = as.expression(
      sapply(1:d, function(j) bquote(italic(u[.(j)])))))

## Randomized Korobov's sequence
set.seed(271)
u <- korobov(n, d = d, generator = generator, randomize = TRUE)
pairs(u, gap = 0, pch = ".", labels = as.expression(
      sapply(1:d, function(j) bquote(italic(u[.(j)])))))

## Generalized Halton sequence (randomized by definition)
set.seed(271)
u <- ghalton(n, d)
pairs(u, gap = 0, pch = ".", labels = as.expression(
      sapply(1:d, function(j) bquote(italic(u[.(j)])))))

## Randomized Sobol sequence (with digital shift)
set.seed(271)
u <- sobol(n, d, randomize = TRUE)
pairs(u, gap = 0, pch = ".", labels = as.expression(
      sapply(1:d, function(j) bquote(italic(u[.(j)])))))

## Check whether a Sobol' sequence of size 2*n equals one of size n
## and, concatenated, one of size n with the first n numbers skipped
f <- function(n)
{
    set.seed(271)
    a <- sobol(2*n, randomize = TRUE)
    set.seed(271)
    b1 <- sobol(n, randomize = TRUE)
    set.seed(271)
    b2 <- sobol(n, randomize = TRUE, skip = n)
    all(all.equal(apply(cbind(a, c(b1, b2)), 1, diff), rep(0, 2*n)))
}
stopifnot(sapply(1:10, f)) # check for n = 1, ..., 10

## Careful when using skip > 0 and randomize = TRUE => seed matters!

## Drawing all points at once (works, of course)
n <- 32
set.seed(5)
U.2n <- sobol(2*n, d = 2, randomize = TRUE)
plot(U.2n, main = "All points generated at once",
     xlab = expression(U[1]), ylab = expression(U[2]))

## Drawing successively with the same seed (typically the right approach)
set.seed(5)
U.n.1 <- sobol(n, d = 2, randomize = TRUE)
set.seed(5) # => same seed
U.n.2 <- sobol(n, d = 2, randomize = TRUE, skip = n)
U.2n.same.seed <- rbind(U.n.1, U.n.2)
plot(U.2n.same.seed,
     main = "Drawing successively, with the same seed",
     xlab = expression(U[1]), ylab = expression(U[2]))
stopifnot(all.equal(U.2n, U.2n.same.seed)) # sanity check

## Drawing successively but with different seeds (typically the wrong approach)
set.seed(5)
U.n.1 <- sobol(n, d = 2, randomize = TRUE, skip = 0)
set.seed(22)
U.n.2 <- sobol(n, d = 2, randomize = TRUE, skip = n)
U.2n.different.seed <- rbind(U.n.1, U.n.2)
plot(U.2n.different.seed,
     main = "Drawing successively, with different seeds",
     xlab = expression(U[1]), ylab = expression(U[2]))



