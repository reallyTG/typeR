library(reservoir)


### Name: reservoir
### Title: reservoir: Tools for Analysis, Design, and Operation of Water
###   Supply Storages
### Aliases: reservoir reservoir-package

### ** Examples

# 1. Express the distribution of Rippl storage for a known inflow process...
layout(1:4)
# a) Assume the inflow process follows a lognormal distribution
# (meanlog = 0, sdlog = 1):
x <- rlnorm(1200)

# b) Convert to a 100-year, monthly time series object beginning Jan 1900
x <- ts(x, start = c(1900, 1), frequency = 12)

# c) Begin reservoir analysis... e.g., compute the Rippl storage
x_Rippl <- Rippl(x, target = mean(x) * 0.9)
no_fail_storage <- x_Rippl$Rippl_storage

# d) Resample x and loop the procedure multiple times to get the
# distribution of no-failure storage for the inflow process assuming
# constant release (R) equal to 90 percent of the mean inflow.
no_fail_storage <- vector("numeric", 100)
for (i in 1:length(no_fail_storage)){
  x <- ts(rlnorm(1200), start = c(1900, 1), frequency = 12)
  no_fail_storage[i] <- Rippl(x, target = mean(x) * 0.9 ,plot = FALSE)$No_fail_storage
}
hist(no_fail_storage)


# 2. Trade off between annual reliability and vulnerability for a given system...
layout(1:1)
# a) Define the system: inflow time series, storage, and target release.
inflow_ts <- resX$Q_Mm3
storage_cap <- resX$cap_Mm3
demand <- 0.3 * mean(resX$Q_Mm3)

# b) define range of loss exponents to control preference of high reliability
# (low loss exponent) or low vulnerability (high loss exponent).
loss_exponents <- c(1.0, 1.5, 2)

# c) set up results table
pareto_results <- data.frame(matrix(ncol = 2, nrow = length(loss_exponents)))
names(pareto_results) <- c("reliability", "vulnerability")
row.names(pareto_results) <- loss_exponents

# d) loop the sdp function through all loss exponents and plot results
for (loss_f in loss_exponents){
 sdp_temp <- sdp_supply(inflow_ts, capacity = storage_cap, target = demand, rep_rrv = TRUE,
 S_disc = 100, R_disc = 10, plot = FALSE, loss_exp = loss_f, Markov = TRUE)
 pareto_results$reliability[which(row.names(pareto_results)==loss_f)] <- sdp_temp$annual_reliability
 pareto_results$vulnerability[which(row.names(pareto_results)==loss_f)] <- sdp_temp$vulnerability
 }
plot (pareto_results$reliability,pareto_results$vulnerability, type = "b", lty = 3)



