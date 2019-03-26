library(repeated)


### Name: capture
### Title: Capture-recapture Models
### Aliases: capture setup
### Keywords: models

### ** Examples


y <- c(0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,14,1,1,0,2,1,2,1,16,0,2,0,11,
	2,13,10,0)
n <- 5
eval(setup)
# closed population
print(z0 <- glm(y~p1+p2+p3+p4+p5, family=poisson, weights=pw))
# deaths and emigration only
print(z1 <- update(z0, .~.+d1+d2+d3))
# immigration only
print(z2 <- update(z1, .~.-d1-d2-d3+b2+b3+b4))
# deaths, emigration, and immigration
print(z3 <- update(z2, .~.+d1+d2+d3))
# add trap dependence
print(z4 <- update(z3, .~.+i2+i3))
# constant capture probability over the three middle periods
print(z5 <- glm(y~p1+pbd+p5+d1+d2+d3+b2+b3+b4, family=poisson, weights=pw))
# print out estimates
capture(z5, n)




