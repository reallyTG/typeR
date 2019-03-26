
library("tram")
library("sandwich")

### scores for fixed parameters
cars$int <- 1
a0 <- Lm(dist ~ speed, data = cars)
a1 <- Lm(dist ~ speed + int, data = cars, fixed = c("int" = 0))

s0 <- estfun(a0)
s1 <- estfun(a1)
s2 <- estfun(a1, parm = coef(as.mlt(a1), fixed = TRUE))

stopifnot(all.equal(s0[,"(Intercept)"], -s2[,"int"]))
stopifnot(all.equal(s1[,"(Intercept)"], -s2[,"int"]))
stopifnot(all.equal(s2[,"(Intercept)"], -s2[,"int"]))

