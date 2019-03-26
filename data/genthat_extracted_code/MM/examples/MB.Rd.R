library(MM)


### Name: MB
### Title: Multivariate multiplicative binomial distribution
### Aliases: MB MB-class as.array.MB as.array.gunter_MB print.gunter_MB
###   counts,MB-method counts getM,MB-method getM

### ** Examples


a <- matrix(c(1,0,0, 1,0,0, 1,1,1, 2,3,1, 2,0,1),5,3,byrow=TRUE)
m <- c(2,3,1)
mx <- MB(a, m, letters[1:3])   # mx is of class 'MB'; column headings
                   #  mean "a" and "not a".
ax <- as.array(mx)
gx <- gunter(ax)
ax2 <- as.array(gx)

data(danaher)
summary(Lindsey_MB(danaher))




