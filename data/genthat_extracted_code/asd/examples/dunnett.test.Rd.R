library(asd)


### Name: dunnett.test
### Title: Dunnett Test
### Aliases: dunnett.test
### Keywords: design

### ** Examples


dunnett.test(c(0.75,1.5,2.25))

# select two treatments only
dunnett.test(c(0.75,1.5,2.25),select=c(1,1,0))

# set test statistic to -Inf
dunnett.test(c(0.75,1.5,-Inf))




