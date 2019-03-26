library(psyphy)


### Name: ecc2
### Title: 4-afc Detection and Identification of Letters
### Aliases: ecc2
### Keywords: datasets

### ** Examples

data(ecc2)
library(lattice)
xyplot(Correct/(Correct + Incorrect) ~ Contr | Size * task, ecc2, 
		type = "b", scale = list(x = list(log = TRUE), 
		y = list(limits = c(0, 1.05))),
		xlab = "Contrast", ylab = "Proportion Correct Response",
		panel = function(x, y, ...) {
			panel.xyplot(x, y, ...)
			panel.abline(h = 0.25, lty = 2)
			})




