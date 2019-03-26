library(MCI)


### Name: huff.fit
### Title: Fitting the Huff model using local optimization of attractivity
### Aliases: huff.fit

### ** Examples

data(Freiburg1)
data(Freiburg2)
data(Freiburg3)
# Loading the three Freiburg datasets

# NOTE: This may take a while!
# huff_total_opt2 <- huff.fit(Freiburg1, "district", "store", "salesarea", "distance", 
# lambda = -2, dtype= "pow", lambda2 = NULL, Freiburg2, "district", "ppower", 
# Freiburg3, "store", "annualsales", tolerance = 1, iterations = 2, output = "total", 
# show_proc = TRUE)
# 2 iterations of the optimization algorithm with an accepted difference of +/- 1 %
# Output of total sales/shares, stored in dataset huff_total_opt10

# model.fit(huff_total_opt2$total_obs, huff_total_opt2$sum_E_j, plotVal = TRUE)
# total_obs = observed total values, originally from dataset Freiburg3
# sum_E_j = expected total values



