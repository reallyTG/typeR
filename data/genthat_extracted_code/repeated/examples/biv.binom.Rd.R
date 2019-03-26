library(repeated)


### Name: biv.binom
### Title: Marginal Bivariate Binomial Regression Models
### Aliases: biv.binom
### Keywords: models

### ** Examples


# 5 2x2 tables
Freq <- matrix(rpois(20,10),ncol=4)
x <- c(6,8,10,12,14)
print(z <- biv.binom(Freq,marg1=~x,marg2=~x,inter=~x,pmarg1=c(-2,0.08),
	pmarg2=c(-2,0.1),pinter=c(3,0)))




