library(compositions)


### Name: R2
### Title: R square
### Aliases: R2 R2.lm R2.default Rsquare
### Keywords: multivariate

### ** Examples

data(Orange)
R2(lm(circumference~age,data=Orange))
R2(lm(log(circumference)~log(age),data=Orange))



