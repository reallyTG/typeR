library(gamlss.inf)


### Name: gamlssZadj
### Title: Fitting positive real line response variable with zeros.
### Aliases: gamlssZadj
### Keywords: regression

### ** Examples

  y0 <- rZAGA(1000, mu=.3, sigma=.4, nu=.15)# p0=0.13
  g0 <- gamlss(y0~1, family=ZAGA)
 t0 <- gamlssZadj(y=y0, mu.formula=~1, family=GA, trace=TRUE)
AIC(g0,t0, k=0)



