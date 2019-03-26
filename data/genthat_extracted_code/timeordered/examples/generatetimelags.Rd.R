library(timeordered)


### Name: generatetimelags
### Title: Constructs matrix of increasingly large time windows suitable
###   for assessing how window size affects time aggregated networks
### Aliases: generatetimelags
### Keywords: ~kwd1 ~kwd2

### ** Examples

tl100 <- generatetimelags(0,1500,100)
boxplot(t(tl100))



