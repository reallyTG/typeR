library(binGroup)


### Name: bgtCI
### Title: Confidence Intervals for One Proportion in Binomial Group
###   Testing
### Aliases: bgtCI bgtCP bgtBlaker bgtAC bgtWilson bgtWald bgtSOC
### Keywords: htest

### ** Examples


# See the example in Tebbs and Bilder (2004)
# the two.sided 95-percent 
# Clopper-Pearson as default method:

bgtCI(n=24,y=3,s=7)
bgtCI(n=24,y=3,s=7,conf.level=0.95,
 alternative="two.sided", method="CP")

# other methods:
# Blaker CI is exact but shorter
# than Clopper-Pearson, only two.sided

bgtCI(n=24,y=3,s=7, alternative="two.sided",
 method="Blaker")

# the asymptotic Wilson CI might even
# be shorter: 

bgtCI(n=24,y=3,s=7, alternative="two.sided",
 method="Score")

# one-sided confidence intervals:

bgtCI(n=24,y=3,s=7, alternative="less", method="CP")

# Wilson Score interval is less conservative 
bgtCI(n=24,y=3,s=7, alternative="less", method="Score")

# the second-order corrected CI is even shorter
# in this situation:
bgtCI(n=24,y=3,s=7, alternative="less", method="SOC")




