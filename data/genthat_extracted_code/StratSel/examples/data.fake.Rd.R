library(StratSel)


### Name: data.fake
### Title: Fake Data for Illustration
### Aliases: data.fake
### Keywords: datasets

### ** Examples

data(data.fake)
summary(data.fake)
## Not run: 
##D out1 <- StratSel(Y ~ var.A + var.B | var.C + var.D | 
##D 	var.E + var.C, data=data.fake, corr=TRUE)
## End(Not run)
## Not run: summary(out1)
# True parameters are 1 or 2 except the three constant terms (which are 0). 
# The correlation parameter was set to +0.6. 



