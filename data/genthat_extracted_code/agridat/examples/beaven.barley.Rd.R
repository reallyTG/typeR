library(agridat)


### Name: beaven.barley
### Title: Yields of 8 barley varieties in 1913 as used by Student.
### Aliases: beaven.barley
### Keywords: datasets

### ** Examples


data(beaven.barley)
dat <- beaven.barley

# Match the means shown in Richey table IV
tapply(dat$yield, dat$gen, mean)
##       a       b       c       d       e       f       g       h
## 298.080 300.710 318.685 295.260 306.410 276.475 304.605 271.820

# Compare to Student 1923, diagram I,II
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          aspect=15/96, # true aspect
          main="beaven.barley - variety trial", text=gen)
}




