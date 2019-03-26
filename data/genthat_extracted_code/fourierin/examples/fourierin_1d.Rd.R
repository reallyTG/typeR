library(fourierin)


### Name: fourierin_1d
### Title: Univariate Fourier integrals
### Aliases: fourierin_1d

### ** Examples

##--- Example 1 ---------------------------------------------------
##--- Recovering std. normal from its characteristic function -----
library(fourierin)

#' Function to to be used in integrand
myfun <- function(t) exp(-t^2/2)

                                        # Compute Foueien integral
out <- fourierin_1d(f = myfun,
                    lower_int = -5, upper_int = 5,
                    lower_eval = -3, upper_eval = 3,
                    const_adj = -1, freq_adj = -1,
                    resolution = 64)

## Extract grid and values
grid <- out$w
values <- Re(out$values)

plot(grid, values, type = "l", col = 3)
lines(grid, dnorm(grid), col = 4)

##--- Example 2 -----------------------------------------------
##--- Computing characteristic function of a gamma r. v. ------

library(fourierin)

## Function to to be used in integrand
myfun <- function(t) dgamma(t, shape, rate)

## Compute integral
shape <- 5
rate <- 3
out <- fourierin_1d(f = myfun, lower_int = 0, upper_int = 6,
                    lower_eval = -4, upper_eval = 4,
                    const_adj = 1, freq_adj = 1, resolution = 64)

grid <- out$w                           # Extract grid
re_values <- Re(out$values)             # Real values
im_values <- Im(out$values)             # Imag values

                                     # Now compute the real and
                                     # imaginary true values of the
                                        # characteric function.
true_cf <- function(t, shape, rate) (1 - 1i*t/rate)^-shape
true_re <- Re(true_cf(grid, shape, rate))
true_im <- Im(true_cf(grid, shape, rate))

                                     # Compare them. We can see a
                                     # slight discrepancy on the
                                     # tails, but that is fixed
                                     # when resulution is
                                     # increased.
plot(grid, re_values, type = "l", col = 3)
lines(grid, true_re, col = 4)

                                        # Same here
plot(grid, im_values, type = "l", col = 3)
lines(grid, true_im, col = 4)



