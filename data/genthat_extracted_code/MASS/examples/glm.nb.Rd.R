library(MASS)


### Name: glm.nb
### Title: Fit a Negative Binomial Generalized Linear Model
### Aliases: glm.nb family.negbin logLik.negbin
### Keywords: regression models

### ** Examples

quine.nb1 <- glm.nb(Days ~ Sex/(Age + Eth*Lrn), data = quine)
quine.nb2 <- update(quine.nb1, . ~ . + Sex:Age:Lrn)
quine.nb3 <- update(quine.nb2, Days ~ .^4)
anova(quine.nb1, quine.nb2, quine.nb3)
## Don't show: 
## PR#1695
y <- c(7, 5, 4, 7, 5, 2, 11, 5, 5, 4, 2, 3, 4, 3, 5, 9, 6, 7, 10, 6, 12,
6, 3, 5, 3, 9, 13, 0, 6, 1, 2, 0, 1, 0, 0, 4, 5, 1, 5, 3, 3, 4)

lag1 <- c(0, 7, 5, 4, 7, 5, 2, 11, 5, 5, 4, 2, 3, 4, 3, 5, 9, 6, 7, 10,
6, 12, 6, 3, 5, 3, 9, 13, 0, 6, 1, 2, 0, 1, 0, 0, 4, 5, 1, 5, 3, 3)

lag2 <- c(0, 0, 7, 5, 4, 7, 5, 2, 11, 5, 5, 4, 2, 3, 4, 3, 5, 9, 6, 7,
10, 6, 12, 6, 3, 5, 3, 9, 13, 0, 6, 1, 2, 0, 1, 0, 0, 4, 5, 1, 5, 3)

lag3 <- c(0, 0, 0, 7, 5, 4, 7, 5, 2, 11, 5, 5, 4, 2, 3, 4, 3, 5, 9, 6,
7, 10, 6, 12, 6, 3, 5, 3, 9, 13, 0, 6, 1, 2, 0, 1, 0, 0, 4, 5, 1, 5)

(fit <- glm(y ~ lag1+lag2+lag3, family=poisson(link=identity),
            start=c(2, 0.1, 0.1, 0.1)))
try(glm.nb(y ~ lag1+lag2+lag3, link=identity))
glm.nb(y ~ lag1+lag2+lag3, link=identity,  start=c(2, 0.1, 0.1, 0.1))
glm.nb(y ~ lag1+lag2+lag3, link=identity,  start=coef(fit))
glm.nb(y ~ lag1+lag2+lag3, link=identity, etastart=rep(5, 42))
## End(Don't show)


