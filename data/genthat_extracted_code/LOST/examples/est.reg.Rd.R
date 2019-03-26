library(LOST)


### Name: est.reg
### Title: A-priori size regression for missing data estimation
### Aliases: est.reg

### ** Examples


data(crocs)

## remove 30% of data points
croc.miss<-missing.data(crocs,0.3)
croc.miss

## assume col 1 is the size variable
croc.new<-est.reg(croc.miss,1)
croc.new



