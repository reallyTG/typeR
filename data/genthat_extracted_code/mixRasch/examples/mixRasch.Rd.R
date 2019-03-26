library(mixRasch)


### Name: mixRasch
### Title: Function for estimating and evaluating mixture Rasch models
###   using JMLE
### Aliases: mixRasch
### Keywords: misc

### ** Examples


# Example data included with mixRasch
data(SimMix)

test1 <- mixRasch(SimMix,1,50, conv.crit=.0001, n.c=1)
test2 <- mixRasch(SimMix,1,500, conv.crit=.0001, n.c=2)

# Notice that the AIC and BIC are lowest for the 2 class solution
rbind(test1$info.fit,test2$info.fit)

# Notice that the two "difficulty" columns are ordered differently
# The results reflect that the two groups in the data set have a reversed
# scale from one another.
test2




