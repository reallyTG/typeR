library(multicon)


### Name: lin.coef
### Title: Linear Coefficients
### Aliases: lin.coef
### Keywords: linear regression coefficients

### ** Examples

data(RSPdata)
	# Lets predict self reported extraversion from gender
lin.coef(RSPdata$ssex,RSPdata$sEXT)
	# confirm that these numbers match the results from lm()
lm(sEXT ~ ssex, data = RSPdata)



