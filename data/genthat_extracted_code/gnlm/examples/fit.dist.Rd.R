library(gnlm)


### Name: fit.dist
### Title: Fit Probability Distributions to Frequency Data
### Aliases: fit.dist
### Keywords: models

### ** Examples


f <- c(215, 1485, 5331, 10649, 14959, 11929, 6678, 2092, 342)
y <- seq(0,8)
fit.dist(y, f, "binomial", plot=TRUE, xlab="Number of males",
	main="Distribution of males in families of 8 children")
#
f <- c(1,1,6,3,4,3,9,6,5,16,4,11,6,11,3,4,5,6,4,4,5,1,1,4,1,2,
	0,2,0,0,1)
y <- seq(1100,4100,by=100)
fit.dist(y, f, "normal", delta=100, plot=TRUE,
	xlab="Monthly salary (dollars)",
	main="Distribution of women mathematicians' salaries")
fit.dist(y, f, "log normal", delta=100, plot=TRUE, add=TRUE, lty=3)
fit.dist(y, f, "logistic", delta=100, exact=FALSE, plot=TRUE, add=TRUE, lty=2)




