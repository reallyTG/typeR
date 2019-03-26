library(PDQutils)


### Name: cumulant2moment
### Title: Convert raw cumulants to moments.
### Aliases: cumulant2moment
### Keywords: distribution

### ** Examples

# normal distribution, mean 0, variance 1
n.mom <- cumulant2moment(c(0,1,0,0,0,0))
# normal distribution, mean 1, variance 1
n.mom <- cumulant2moment(c(1,1,0,0,0,0))



