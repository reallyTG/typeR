library(broom)


### Name: tidy.gamlss
### Title: Tidy a(n) gamlss object
### Aliases: tidy.gamlss

### ** Examples


library(gamlss)

g <- gamlss(
  y ~ pb(x),
  sigma.fo = ~ pb(x),
  family = BCT,
  data = abdom,
  method = mixed(1, 20)
)

tidy(g)




