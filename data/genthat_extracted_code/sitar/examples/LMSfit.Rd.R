library(sitar)


### Name: LMSfit
### Title: Estimate LMS curves from tabulated growth reference centiles
### Aliases: LMSfit
### Keywords: arith

### ** Examples


## first construct table of boys weight centiles by age for WHO standard
data(who06)
zs <- -4:4*2/3 # z-scores for centiles
ages <- 0:12/4 # ages 0-3 years by 3 months
v <- vapply(as.list(zs), function(z)
 LMS2z(ages, z, sex = 1, measure = 'wt', ref = 'who06', toz = FALSE),
  rep(0, length(ages)))
round(v, 2)

## then back-calculate the original LMS curves and display summary statistics
LMSfit(x=ages, y=v, sex=1, centiles=pnorm(zs)*100, plot=FALSE)




