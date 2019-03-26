library(DAMisc)


### Name: panel.ci
### Title: Lattice panel function for confidence intervals
### Aliases: panel.ci

### ** Examples

library(car)
library(lattice)
data(Ornstein)
mod <- lm(interlocks ~ log(assets)*nation, data=Ornstein)
mod.out <- intQualQuant(mod, c("log(assets)", "nation"), 
	n=25, plot=FALSE, type="facs")
xyplot(fit ~ x | contrast, data=mod.out, 
	xlab = "Assets", ylab = "Difference In Fitted Values", 
	lower=mod.out$lower, upper=mod.out$upper, zl=TRUE, 
	prepanel=prepanel.ci, panel=panel.ci)



