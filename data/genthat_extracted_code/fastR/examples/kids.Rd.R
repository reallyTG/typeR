library(fastR)


### Name: kids
### Title: Goals and popularity factors for school kids
### Aliases: kids
### Keywords: datasets

### ** Examples


data(kids)
xtabs(~Goals + Urban.Rural, data=kids)
chisq.test(xtabs(~Goals + Urban.Rural, data=kids))




