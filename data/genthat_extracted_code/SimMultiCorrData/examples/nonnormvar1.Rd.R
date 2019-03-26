library(SimMultiCorrData)


### Name: nonnormvar1
### Title: Generation of One Non-Normal Continuous Variable Using the Power
###   Method
### Aliases: nonnormvar1
### Keywords: Fleishman, Headrick continuous, simulation, univariate,

### ** Examples

# Normal distribution with Headrick's fifth-order PMT:
N <- nonnormvar1("Polynomial", 0, 1, 0, 0, 0, 0)

## Not run: 
##D # Use Headrick & Kowalchuk's (2007) steps to compare a simulated exponential
##D # (mean = 2) variable to the theoretical exponential(mean = 2) density:
##D 
##D # 1) Obtain the standardized cumulants:
##D stcums <- calc_theory(Dist = "Exponential", params = 0.5) # rate = 1/mean
##D 
##D # 2) Simulate the variable:
##D H_exp <- nonnormvar1("Polynomial", means = 2, vars = 2, skews = stcums[3],
##D                     skurts = stcums[4], fifths = stcums[5],
##D                     sixths = stcums[6], n = 10000, seed = 1234)
##D 
##D H_exp$constants
##D #           c0        c1       c2         c3          c4           c5
##D # 1 -0.3077396 0.8005605 0.318764 0.03350012 -0.00367481 0.0001587076
##D 
##D # 3) Determine whether the constants produce a valid power method pdf:
##D 
##D H_exp$valid.pdf
##D # [1] "TRUE"
##D 
##D # 4) Select a critical value:
##D 
##D # Let alpha = 0.05.
##D y_star <- qexp(1 - 0.05, rate = 0.5) # note that rate = 1/mean
##D y_star
##D # [1] 5.991465
##D 
##D # 5) Solve m_{2}^{1/2} * p(z') + m_{1} - y* = 0 for z', where m_{1} and
##D # m_{2} are the 1st and 2nd moments of Y*:
##D 
##D # The exponential(2) distribution has a mean and standard deviation equal
##D # to 2.
##D # Solve 2 * p(z') + 2 - y_star = 0 for z'
##D # p(z') = c0 + c1 * z' + c2 * z'^2 + c3 * z'^3 + c4 * z'^4 + c5 * z'^5
##D 
##D f_exp <- function(z, c, y) {
##D   return(2 * (c[1] + c[2] * z + c[3] * z^2 + c[4] * z^3 + c[5] * z^4 +
##D               c[6] * z^5) + 2 - y)
##D }
##D 
##D z_prime <- uniroot(f_exp, interval = c(-1e06, 1e06),
##D                    c = as.numeric(H_exp$constants), y = y_star)$root
##D z_prime
##D # [1] 1.644926
##D 
##D # 6) Calculate 1 - Phi(z'), the corresponding probability for the
##D # approximation Y to Y* (i.e. 1 - Phi(z') = 0.05), and compare to target
##D # value alpha:
##D 
##D 1 - pnorm(z_prime)
##D # [1] 0.04999249
##D 
##D # 7) Plot a parametric graph of Y* and Y:
##D 
##D plot_sim_pdf_theory(sim_y = as.numeric(H_exp$continuous_variable[, 1]),
##D                     Dist = "Exponential", params = 0.5)
##D 
##D # Note we can also plot the empirical cdf and show the cumulative
##D # probability up to y_star:
##D 
##D plot_sim_cdf(sim_y = as.numeric(H_exp$continuous_variable[, 1]),
##D              calc_cprob = TRUE, delta = y_star)
##D 
## End(Not run)



