library(effsize)


### Name: cohen.d
### Title: Cohen's d and Hedges g effect size
### Aliases: cohen.d cohen.d.default cohen.d.formula
### Keywords: effect size Hedges Cohen

### ** Examples

treatment = rnorm(100,mean=10)
control = rnorm(100,mean=12)
d = (c(treatment,control))
f = rep(c("Treatment","Control"),each=100)
## compute Cohen's d
## treatment and control
cohen.d(treatment,control)
## data and factor
cohen.d(d,f)
## formula interface
cohen.d(d ~ f)
## compute Hedges' g
cohen.d(d,f,hedges.correction=TRUE)



