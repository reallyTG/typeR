library(AER)


### Name: Guns
### Title: More Guns, Less Crime?
### Aliases: Guns
### Keywords: datasets

### ** Examples

## data
data("Guns")

## visualization
library("lattice")
xyplot(log(violent) ~ as.numeric(as.character(year)) | state, data = Guns, type = "l")

## Stock & Watson (2007), Empirical Exercise 10.1, pp. 376--377
fm1 <- lm(log(violent) ~ law, data = Guns)
coeftest(fm1, vcov = sandwich)

fm2 <- lm(log(violent) ~ law + prisoners + density + income + 
  population + afam + cauc + male, data = Guns)
coeftest(fm2, vcov = sandwich)

fm3 <- lm(log(violent) ~ law + prisoners + density + income + 
  population + afam + cauc + male + state, data = Guns)
printCoefmat(coeftest(fm3, vcov = sandwich)[1:9,])
            
fm4 <- lm(log(violent) ~ law + prisoners + density + income + 
  population + afam + cauc + male + state + year, data = Guns)
printCoefmat(coeftest(fm4, vcov = sandwich)[1:9,])



