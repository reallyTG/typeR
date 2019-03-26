library(comparison)


### Name: calc.ece
### Title: Empirical cross-entropy calculation
### Aliases: calc.ece
### Keywords: models

### ** Examples

#library(comparison)
LR.same <- c(0.5, 2, 4, 6, 8, 10) 		# the same has 1 LR < 1
LR.different <- c(0.2, 0.4, 0.6, 0.8, 1.1) 	# the different has 1 LR > 1
ece.1 <- calc.ece(LR.same, LR.different)	# simplest invocation
plot(ece.1)					# use plot method



