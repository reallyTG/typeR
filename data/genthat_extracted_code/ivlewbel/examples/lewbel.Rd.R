library(ivlewbel)


### Name: lewbel
### Title: Identification using heteroscedasticity
### Aliases: lewbel print.lewbel.model

### ** Examples


set.seed(1234)
n = 1000
x1 = rnorm(n, 0, 1)
x2 = rnorm(n, 0, 1)
u = rnorm(n, 0, 1)
s1 = rnorm(n, 0, 1)
s2 =  rnorm(n, 0, 1)
ov = rnorm(n, 0, 1)
z1 = rnorm(n, 0 ,1)
e1 = u + exp(x1)*s1 + exp(x2)*s1
e2 = u + exp(-x1)*s2 + exp(-x2)*s2
y1 = 1 + x1 + x2 + ov + e2 + 2*z1
y2 = 1 + x1 + x2 + y1 + 2*ov + e1
data = data.frame(y2, y1, x1, x2, z1)

lewbel(formula = y2 ~ y1 | x1 + x2 | x1 + x2, data = data)
lewbel(formula = y2 ~ y1 | x1 + x2 | x1 + x2 | z1, data = data)



