library(tigerstats)


### Name: RandomExp
### Title: Randomized Experimental Designs
### Aliases: RandomExp

### ** Examples

data(SmallExp) #small hypothetical list of subjects

#completely randomized design
RandomExp(SmallExp)  

#Block with reppect to sex:
RandomExp(SmallExp,sizes=c(8,8),groups=letters[1:2],block="sex")

#Block for both sex and athletic status:
RandomExp(SmallExp,sizes=c(8,8),groups=letters[1:2],block=c("sex","athlete"))



