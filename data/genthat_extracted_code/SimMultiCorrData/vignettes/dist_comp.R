## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(fig.width = 6, fig.height = 4.5) 

## ---- warning = FALSE, message = FALSE-----------------------------------
library("SimMultiCorrData")
library("printr")
stcums <- calc_theory(Dist = "Exponential", params = 0.5)

## ---- warning = FALSE, message = FALSE-----------------------------------
H_exp <- nonnormvar1("Polynomial", means = stcums[1], vars = stcums[2]^2, 
                     skews = stcums[3], skurts = stcums[4], 
                     fifths = stcums[5], sixths = stcums[6], n = 10000, 
                     seed = 1234)

## ------------------------------------------------------------------------
as.matrix(H_exp$constants, nrow = 1, ncol = 6, byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(H_exp$summary_targetcont[, c("Distribution", "mean", "sd", 
                                             "skew", "skurtosis", "fifth", 
                                             "sixth")], 5), nrow = 1, ncol = 7,
          byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(H_exp$summary_continuous[, c("Distribution", "mean", "sd", 
                                             "skew", "skurtosis", "fifth", 
                                             "sixth")], 5), nrow = 1, ncol = 7,
          byrow = TRUE)

## ------------------------------------------------------------------------
H_exp$valid.pdf

## ------------------------------------------------------------------------
y_star <- qexp(1 - 0.05, rate = 0.5) # note that rate = 1/mean
y_star

## ------------------------------------------------------------------------
f_exp <- function(z, c, y) {
  return(2 * (c[1] + c[2] * z + c[3] * z^2 + c[4] * z^3 + c[5] * z^4 + 
                c[6] * z^5) + 2 - y)
}

z_prime <- uniroot(f_exp, interval = c(-1e06, 1e06), 
                   c = as.numeric(H_exp$constants), y = y_star)$root
z_prime

## ------------------------------------------------------------------------
1 - pnorm(z_prime)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(sim_y = H_exp$continuous_variable[, 1], 
                    Dist = "Exponential", params = 0.5)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_cdf(sim_y = H_exp$continuous_variable[, 1], calc_cprob = TRUE, 
             delta = y_star)

## ---- warning = FALSE, message = FALSE-----------------------------------
as.matrix(t(stats_pdf(c = H_exp$constants[1, ], method = "Polynomial", 
                    alpha = 0.025, mu = stcums[1], sigma = stcums[2]))) 

