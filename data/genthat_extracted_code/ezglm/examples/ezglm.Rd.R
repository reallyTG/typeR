library(ezglm)


### Name: ezglm
### Title: selects significant non-additive interaction between two
###   variables using fast GLM implementation.
### Aliases: ezglm
### Keywords: models regression

### ** Examples

n = 10000
x1 = rnorm(n)
x2 = rnorm(n)
y1 = sample(c(0,1),n,rep=TRUE)
y2 = rnorm(n)

system.time(m1 <- ezglm(y1, x1, x2, 1, family = "binomial"))
m1

system.time(m2 <- glm(y1~x1+x2+x1*x2, family = binomial))
summary(m2)$coef

system.time(m3 <- ezglm(y2, x1, x2, 1, family = "gaussian"))
m3

system.time(m4 <- glm(y2~x1+x2+x1*x2, family = gaussian))
summary(m4)$coef




