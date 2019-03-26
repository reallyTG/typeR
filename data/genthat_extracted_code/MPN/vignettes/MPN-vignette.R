## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----Define likelihood R function----------------------------------------
#likelihood
L <- function(lambda, positive, tubes, amount) {
  binom_coef <- choose(tubes, positive)
  exp_term   <- exp(-lambda * amount)
  prod(binom_coef * ((1 - exp_term) ^ positive) * exp_term ^ (tubes - positive))
}
L_vec <- Vectorize(L, "lambda")

## ----Calculate MPN estimate----------------------------------------------
#MPN calculation
library(MPN)
my_positive <- c(1, 1, 1) #xi
my_tubes    <- c(3, 3, 3) #ni
my_amount   <- 10 * c(1, .1, .01)  #zi
(my_mpn <- mpn(my_positive, my_tubes, my_amount))

## ----Plot likelihood and MPN estimate------------------------------------
my_mpn$MPN
lambda <- seq(0, 0.5, by = .001)
my_L   <- L_vec(lambda, my_positive, my_tubes, my_amount)
plot(lambda, my_L, type = "l", ylab = "Likelihood", main = "Maximum Likelihood")
abline(v = my_mpn$MPN, lty = 2, col = "red")

## ----No positive tubes---------------------------------------------------
no_positive <- c(0, 0, 0) #xi
(mpn_no_pos <- mpn(no_positive, my_tubes, my_amount)$MPN)
L_no_pos <- L_vec(lambda, no_positive, my_tubes, my_amount)
plot(lambda, L_no_pos, type = "l", xlim = c(-0.02, 0.2), ylab = "Likelihood",
     main = "No Positives")
abline(v = mpn_no_pos, lty = 2, col = "red")

## ----All positive tubes--------------------------------------------------
all_positive <- c(3, 3, 3) #xi
mpn(my_tubes, all_positive, my_amount)$MPN
lambda <- seq(0, 200, by = .1)
L_all_pos <- L_vec(lambda, all_positive, my_tubes, my_amount)
plot(lambda, L_all_pos, type = "l", xlim = c(0, 100), ylim = c(0, 1.1),
     ylab = "Likelihood", main = "All Positives")
abline(h = 1, lty = 2)

