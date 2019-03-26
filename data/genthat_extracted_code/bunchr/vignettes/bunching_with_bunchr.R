## ----settings, include = FALSE, echo = FALSE-----------------------------
library(bunchr)
knitr::opts_chunk$set( fig.width = 7, fig.height = 4,
                      warning = TRUE,
                      error = TRUE )
path = file.path(system.file("extdata", "compare_results.csv", package = "bunchr"))

## ----ability_chunk-------------------------------------------------------
set.seed(42)
ability_vec <- 4000 * rbeta(100000, 2, 5)
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0, 0.1, 0, 1000)
bunch_viewer(earning_vec, 1000, cf_start = 10, cf_end = 10, exclude_before = 2,
             exclude_after = 2, binw = 50, trimy=F)

## ----first_kink----------------------------------------------------------
kink_est <- bunch(earning_vec, zstar = 1000, t1 = 0, t2 = 0.1, Tax = 0,
                   cf_start = 10, cf_end = 10,
                   exclude_before = 2, exclude_after = 2, binw = 50, nboots = 100)
kink_est$e
quantile(kink_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))
kink_est$Bn
quantile(kink_est$booted_Bn, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----second_kink2--------------------------------------------------------
kink_est <- bunch(earning_vec, zstar = 1000, t1 = 0, t2 = 0.1, Tax = 0,
                   cf_start = 500, cf_end = 500,
                   exclude_before = 10, exclude_after = 10, binw = 1,
                   nboots = 100, seed = 123, draw = F)
kink_est$e
quantile(kink_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))
kink_est$Bn
quantile(kink_est$booted_Bn, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----notch1--------------------------------------------------------------
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0.1, 0.1, 200, 1000)
bunch_viewer(earning_vec, 1000, 20, 50, 2, 25, binw = 20)
notch_est <- bunch(earning_vec, zstar = 1000, t1 = 0.1, t2 = 0.1, Tax = 200,
                   cf_start = 20, cf_end = 50, force_after = FALSE,
                   exclude_before = 2, exclude_after = 25, binw = 20,
                   nboots = 100, seed = 123)
notch_est$e
quantile(notch_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----size_small----------------------------------------------------------
ability_vec_small <- 4000 * rbeta(10000, 2, 5)
earnings_small <- sapply(ability_vec_small, earning_fun, 0.2, 0, 0.1, 0, 1000)
kink_est <- bunch(earnings_small, zstar = 1000, t1 = 0, t2 = 0.1, Tax = 0,
                   cf_start = 10, cf_end = 10,
                   exclude_before = 1, exclude_after = 1, binw = 50,
                    nboots = 100, seed = 123)
kink_est$e
quantile(kink_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----size_large----------------------------------------------------------
ability_vec_large <- 4000 * rbeta(1000000, 2, 5)
earnings_large <- sapply(ability_vec_large, earning_fun, 0.2, 0, 0.1, 0, 1000)
kink_est <- bunch(earnings_large, zstar = 1000, t1 = 0, t2 = 0.1, Tax = 0,
                   cf_start = 50, cf_end = 50,
                   exclude_before = 5, exclude_after = 5, binw = 10,
                   nboots = 100, seed = 123)
kink_est$e
quantile(kink_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----size_large2---------------------------------------------------------
kink_est <- bunch(earnings_large, zstar = 1000, t1 = 0, t2 = 0.1, Tax = 0,
                   cf_start = 50, cf_end = 50,
                   exclude_before = 1, exclude_after = 1, binw = 5,
                   nboots = 100, seed = 123, draw = F)
kink_est$e
quantile(kink_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----error1--------------------------------------------------------------
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0.1, 0.1, 0, 1000)
bunch_viewer(earning_vec, 1000, 10, 10, 1, 1, binw = 50, trimy = F)
kink_est <- bunch(earning_vec, zstar = 1000, t1 = 0.1, t2 = 0.1, Tax = 0,
                   cf_start = 50, cf_end = 50,
                   exclude_before = 1, exclude_after = 1, binw = 10,
                   nboots = 100, seed = 123, draw = F)

## ----error2--------------------------------------------------------------
kink_est <- bunch(earning_vec, zstar = 1000, t1 = 0, t2 = 0.1, Tax = 0,
                   cf_start = 50, cf_end = 50,
                   exclude_before = 1, exclude_after = 1, binw = 10,
                   nboots = 100, seed = 123, draw = F)
kink_est$e
quantile(kink_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----error3--------------------------------------------------------------
earning_vec <- sapply(ability_vec, earning_fun, elas = 0.2, t1 = 0, t2 = 0.3,
                      Tax = 0, zstar = 1000)
kink_est <- bunch(earning_vec, zstar = 1000, t1 = 0, t2 = 0.2, Tax = 0,
                   cf_start = 50, cf_end = 50,
                   exclude_before = 1, exclude_after = 1, binw = 10,
                   nboots = 100, seed = 123, draw = F)
kink_est$e
quantile(kink_est$booted_e, probs=c(0, 0.05, 0.1, 0.5, 0.9, 0.95, 1))

## ----chetty1, eval=TRUE--------------------------------------------------
set.seed(1982)
ability_vec <- 4000 * rbeta(100000, 2, 5)
earning_vec <- sapply(ability_vec, earning_fun, 0.3, 0, 0.2, 0, 1000)
data <- bunch_viewer(earning_vec, zstar = 1000, binw = 50, report = T)
sim_data <- data.frame(cbind(data$mids,data$counts))
colnames(sim_data) = c("earnings","counts")

## ----chetty2, eval=FALSE-------------------------------------------------
#  write.csv(sim_data, file="sim_data.csv", row.names = F)

## ----chetty2.1, eval=FALSE-----------------------------------------------
#  insheet using "sim_data.csv", clear
#  bunch_count earnings counts, bpoint(1000) ig_low(-10) ig_high(10) low_bunch(-1) high_bunch(1) plot(1) binwidth(50)
#  outsheet using "compare_results.csv", replace delim(",")

## ----chetty3, eval=TRUE--------------------------------------------------
chetty_res <- read.csv(file = path)
chetty_res <- chetty_res[order(chetty_res$earnings), ]

## ----chetty4, eval=TRUE--------------------------------------------------
estim <- bunch(earning_vec, zstar = 1000, t1 = 0, t2 = 0.2, Tax = 0, 
               cf_start = 10, cf_end = 10, exclude_before = 1, exclude_after =  1,
               binw = 50, max_iter = 200, correct = T, select = F, poly_size = 7,
               draw = F)
# creating comparison data-frame
bunchr_res <- estim$data
comp_data <- cbind(bunchr_res, chetty_res)
comp_data$cf_diff <- comp_data$cf_counts - comp_data$plotabc3
comp_data$per_diff <- 100 * comp_data$cf_diff / comp_data$plotabc3

show_data <- comp_data[,c(1,2,3,9,10,11)]
colnames(show_data) <- c("earnings", "counts",
  "bunchr_cf_counts", "bunchcount_cf_counts", "diff",
  "percent_diff")

# write.csv(show_data, file="show_data.csv", row.names=F)

# plot the results
plot(show_data$earnings, show_data$counts, type="h",
     main="comparing bunching counter-factuals",
     xlab="earnings", ylab="counts",
     xlim=c(200,2000))
points(show_data$earnings, show_data$bunchr_cf_counts, col="red", pch="*")
points(show_data$earnings, show_data$bunchcount_cf_counts, col="blue",pch="*")
legend("topleft", lty=c(1, NA, NA), pch=c(NA, "*","*" ), col=c("black","red","blue"),
       legend=c("real counts","bunchr cf", "bunch_count cf"))

