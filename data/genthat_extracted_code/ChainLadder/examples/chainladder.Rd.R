library(ChainLadder)


### Name: chainladder
### Title: Estimate age-to-age factors
### Aliases: chainladder
### Keywords: models

### ** Examples

## Concept of different chain-ladder age-to-age factors.
## Compare Mack's and Barnett & Zehnwirth's papers.
x <- RAA[1:9,1]
y <- RAA[1:9,2]

F <- y/x
## wtd. average chain-ladder age-to-age factors
alpha <- 1 ## Mack notation
delta <- 2 - alpha ## Barnett & Zehnwirth notation

sum(x^alpha*F)/sum(x^alpha)
lm(y~x + 0 ,weights=1/x^delta)
summary(chainladder(RAA, delta=delta)$Models[[1]])$coef

## straight average age-to-age factors
alpha <- 0
delta <- 2 - alpha 
sum(x^alpha*F)/sum(x^alpha)
lm(y~x + 0, weights=1/x^(2-alpha))
summary(chainladder(RAA, delta=delta)$Models[[1]])$coef

## ordinary regression age-to-age factors
alpha=2
delta <- 2-alpha
sum(x^alpha*F)/sum(x^alpha)
lm(y~x + 0, weights=1/x^delta)
summary(chainladder(RAA, delta=delta)$Models[[1]])$coef

## Compare different models
CL0 <- chainladder(RAA)
## age-to-age factors
sapply(CL0$Models, function(x) summary(x)$coef["x","Estimate"])
## f.se
sapply(CL0$Models, function(x) summary(x)$coef["x","Std. Error"])
## sigma
sapply(CL0$Models, function(x) summary(x)$sigma)
predict(CL0)

CL1 <- chainladder(RAA, delta=1)
## age-to-age factors
sapply(CL1$Models, function(x) summary(x)$coef["x","Estimate"])
## f.se
sapply(CL1$Models, function(x) summary(x)$coef["x","Std. Error"])
## sigma
sapply(CL1$Models, function(x) summary(x)$sigma)
predict(CL1)

CL2 <- chainladder(RAA, delta=2)
## age-to-age factors
sapply(CL2$Models, function(x) summary(x)$coef["x","Estimate"])
## f.se
sapply(CL2$Models, function(x) summary(x)$coef["x","Std. Error"])
## sigma
sapply(CL2$Models, function(x) summary(x)$sigma)
predict(CL2)

## Set 'weights' parameter to use only the last 5 diagonals, 
## i.e. the last 5 calendar years
calPeriods <- (row(RAA) + col(RAA) - 1)
(weights <- ifelse(calPeriods <= 5, 0, ifelse(calPeriods > 10, NA, 1)))
CL3 <- chainladder(RAA, weights=weights)
summary(CL3$Models[[1]])$coef
predict(CL3)



