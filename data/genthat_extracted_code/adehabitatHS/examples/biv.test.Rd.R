library(adehabitatHS)


### Name: biv.test
### Title: Bivariate Test
### Aliases: biv.plot biv.test
### Keywords: multivariate

### ** Examples


x = rnorm(1000,2)
y = 2*x+rnorm(1000,2)
dfxy = data.frame(x, y)

biv.plot(dfxy)
biv.plot(dfxy, points=FALSE, col="lightblue", br=20)

p = c(3, 4)
biv.test(dfxy, p)
biv.test(dfxy, p, points=FALSE, Pcol="darkred", col="lightblue", br=20)




