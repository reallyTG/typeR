library(fourierin)


### Name: fourierin
### Title: Compute Fourier integrals
### Aliases: fourierin

### ** Examples

##--- Example 1 ---------------------------------------------------
##--- Recovering std. normal from its characteristic function -----
library(fourierin)

## Function to be used in the integrand
myfnc <- function(t) exp(-t^2/2)

## Compute integral
out <- fourierin(f = myfnc, lower_int = -5, upper_int = 5,
                 lower_eval= -3, upper_eval = 3, const_adj = -1,
                 freq_adj = -1, resolution = 64)

## Extract grid and values
grid <- out$w
values <- Re(out$values)

## Compare with true values of Fourier transform
plot(grid, values, type = "l", col = 3)
lines(grid, dnorm(grid), col = 4)


##--- Example 2 ---------------------------------------------------
##--- Computing characteristic function of a gamma r. v. ----------

library(fourierin)

## Function to be used in integrand
myfnc <- function(t) dgamma(t, shape, rate)

## Compute integral
shape <- 5
rate <- 3
out <- fourierin(f = myfnc, lower_int = 0, upper_int = 6,
                 lower_eval = -4, upper_eval = 4,
                 const_adj = 1, freq_adj = 1, resolution = 64)

## Extract values
grid <- out$w                           # Extract grid
re_values <- Re(out$values)             # Real values
im_values <- Im(out$values)             # Imag values

## Now compute the real and imaginary true values of the
## characteric function.
true_cf <- function(t, shape, rate) (1 - 1i*t/rate)^-shape
true_re <- Re(true_cf(grid, shape, rate))
true_im <- Im(true_cf(grid, shape, rate))

## Compare them. We can see a slight discrepancy on the tails,
## but that is fixed when resulution is increased.
plot(grid, re_values, type = "l", col = 3)
lines(grid, true_re, col = 4)

                                        # Same here
plot(grid, im_values, type = "l", col = 3)
lines(grid, true_im, col = 4)

##--- Example 3 -------------------------------------------------
##--- Recovering std. normal from its characteristic function ---
library(fourierin)

##-Parameters of bivariate normal distribution
mu <- c(-1, 1)
sig <- matrix(c(3, -1, -1, 2), 2, 2)

##-Multivariate normal density
##-x is n x d
f <- function(x) {
    ##-Auxiliar values
    d <- ncol(x)
    z <- sweep(x, 2, mu, "-")
    ##-Get numerator and denominator of normal density
    num <- exp(-0.5*rowSums(z * (z %*% solve(sig))))
    denom <- sqrt((2*pi)^d*det(sig))
    return(num/denom)
}

## Characteristic function
## s is n x d
phi <- function(s) {
    complex(modulus = exp(- 0.5*rowSums(s*(s %*% sig))),
            argument = s %*% mu)
}

##-Approximate cf using Fourier integrals
eval <- fourierin(f, lower_int = c(-8, -6), upper_int = c(6, 8),
                  lower_eval = c(-4, -4), upper_eval = c(4, 4),
                  const_adj = 1, freq_adj =  1,
                  resolution = c(128, 128))

## Extract values
t1 <- eval$w1
t2 <- eval$w2
t <- as.matrix(expand.grid(t1 = t1, t2 = t2))
approx <- eval$values
true <- matrix(phi(t), 128, 128)        # Compute true values


## This is a section of the characteristic function
i <- 65
plot(t2, Re(approx[i, ]), type = "l", col = 2,
     ylab = "",
     xlab = expression(t[2]),
     main = expression(paste("Real part section at ",
                             t[1], "= 0")))
lines(t2, Re(true[i, ]), col = 3)
legend("topleft", legend = c("true", "approximation"),
       col = 3:2, lwd = 1)

##-Another section, now of the imaginary part
plot(t1, Im(approx[, i]), type = "l", col = 2,
     ylab = "",
     xlab = expression(t[1]),
     main = expression(paste("Imaginary part section at ",
                             t[2], "= 0")))
lines(t1, Im(true[, i]), col = 3)
legend("topleft", legend = c("true", "approximation"),
       col = 3:2, lwd = 1)



