library(ltbayes)


### Name: information
### Title: Fisher and Observed Information for an Item Response Model
### Aliases: information

### ** Examples

alph <- c(1.27,1.34,1.14,1,0.67)   # discrimination parameters
beta <- c(1.19,0.59,0.15,-0.59,-2) # difficulty parameters
gamm <- c(0.1,0.15,0.15,0.2,0.01)   # lower asymptote parameters

# Fisher information of a three-parameter logistic binary model
information(fmodel3pl, y = c(0,1,1,1,1), apar = alph, bpar = beta, cpar = gamm)

# plot of Fisher information functions for each item
zeta <- seq(-5, 5, length = 100)
info <- matrix(NA, 100, 5)
for (j in 1:100) {
	info[j,] <- information(fmodel3pl, c(0,1,1,1,1), zeta = zeta[j], 
		apar = alph, bpar = beta, cpar = gamm)$item
}
matplot(zeta, info, type = "l", ylab = "Information", bty = "n", xlab = expression(zeta))
legend(-3, 0.3, paste("Item", 1:5), lty = 1:5, col = 1:5)

# observed information given a sum score of 4
information(fmodel3pl, patterns(5, 2, 4), apar = alph, bpar = beta, cpar = gamm,
	observed = TRUE)



