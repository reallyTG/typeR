library(emdbook)


### Name: Myxo
### Title: Myxomatosis titer data
### Aliases: Myxo MyxoTiter_sum
### Keywords: datasets

### ** Examples

data(MyxoTiter_sum)
library(lattice)
xyplot(titer~day|factor(grade),data=MyxoTiter_sum,xlim=c(0,30))



