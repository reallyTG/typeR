library(jmv)


### Name: propTestN
### Title: Proportion Test (N Outcomes)
### Aliases: propTestN

### ** Examples

data('HairEyeColor')
dat <- as.data.frame(HairEyeColor)

propTestN(formula = Freq ~ Eye, data = dat, ratio = c(1,1,1,1))

#
#  PROPORTION TEST (N OUTCOMES)
#
#  Proportions
#  --------------------------------
#    Level    Count    Proportion
#  --------------------------------
#    Brown      220         0.372
#    Blue       215         0.363
#    Hazel       93         0.157
#    Green       64         0.108
#  --------------------------------
#
#
#  X² Goodness of Fit
#  -----------------------
#    X²     df    p
#  -----------------------
#    133     3    < .001
#  -----------------------
#




