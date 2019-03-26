library(plde)


### Name: plde
### Title: Penalized Log-density Estimation Using Legendre Polynomials
### Aliases: plde

### ** Examples

# clean up
rm(list = ls())
library(plde)
Eruption = faithful$eruptions
Waiting = faithful$waiting
n = length(Eruption)
# fit PLDE
fit_Eruption = plde(Eruption, initial_dimension = 30, number_lambdas = 50)
fit_Waiting = plde(Waiting, initial_dimension = 30, number_lambdas = 50)
x_Eruption = seq(min(Eruption), max(Eruption), length = 100)
x_Waiting = seq(min(Waiting), max(Waiting), length = 100)
fhat_Eruption = compute_fitted(x_Eruption, fit_Eruption$sm[[fit_Eruption$number_lambdas]])
fhat_Waiting = compute_fitted(x_Waiting, fit_Waiting$sm[[fit_Waiting$number_lambdas]])
# display layout
par(mfrow = c(2, 2), oma=c(0,0,2,0), mar = c(4.5, 2.5, 2, 2))
#=======================================
# Eruption
#=======================================
col_index = rainbow(fit_Eruption$number_lambdas)
plot(x_Eruption, fhat_Eruption, type = "n", xlab = "Eruption", ylab = "", main = "")
# all fit plot
for(i in 1 : fit_Eruption$number_lambdas)
{
   fhat = compute_fitted(x_Eruption, fit_Eruption$sm[[i]])
   lines(x_Eruption, fhat, lwd = 0.5, col = col_index[i])
}
k_Eruption = density(Eruption, bw = 0.03)
lines(k_Eruption$x, k_Eruption$y / 2, lty = 2)

# optimal model
hist_col = rgb(0.8,0.8,0.8, alpha = 0.6)
hist(Eruption, nclass = 20, freq = FALSE, xlim = c(1.1, 5.9),
     col = hist_col, ylab = "", main = "", ylim = c(0, 1.2))
fhat_optimal_Eruption = compute_fitted(x_Eruption, fit_Eruption$optimal)
lines(x_Eruption, fhat_optimal_Eruption, col = "black", lwd = 2)
#========================================
# Waiting
#========================================
col_index = rainbow(fit_Waiting$number_lambdas)
plot(x_Waiting, fhat_Waiting, type = "n", xlab = "Waiting", ylab = "", main = "")
# all fit plot
for(i in 1 : fit_Waiting$number_lambdas)
{
   fhat = compute_fitted(x_Waiting, fit_Waiting$sm[[i]])
   lines(x_Waiting, fhat, lwd = 0.5, col = col_index[i])
}
k_Waiting = density(Waiting, bw = 1)
lines(k_Waiting$x, k_Waiting$y / 2, lty = 2)

# optimal model
hist_col = rgb(0.8,0.8,0.8, alpha = 0.6)
hist(Waiting, nclass = 20, freq = FALSE, xlim = c(40, 100),
     col = hist_col, ylab = "", main = "", ylim = c(0, 0.055))
fhat_optimal_Waiting = compute_fitted(x_Waiting, fit_Waiting$optimal)
lines(x_Waiting, fhat_optimal_Waiting, col = "black", lwd = 2)



