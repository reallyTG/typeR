library(agridat)


### Name: brandt.switchback
### Title: Switchback trial of milk yield for two feed mixtures in cattle
### Aliases: brandt.switchback
### Keywords: datasets

### ** Examples


data(brandt.switchback)
dat <- brandt.switchback

# In each period, treatment 2 is slightly higher
# bwplot(yield~trt|period,dat, layout=c(3,1), main="brandt.switchback",
#     xlab="Treatment", ylab="Milk yield")

# Yield at period 2 (trt T2) is above the trend in group A,
# below the trend (trt T1) in group B.
# Equivalently, treatment T2 is above the trend line
require(lattice)
xyplot(yield~period|group, data=dat, group=cow, type=c('l','r'),
    auto.key=list(columns=5), main="brandt.switchback",
    xlab="Period.  Group A: T1,T2,T1.  Group B: T2,T1,T2",
    ylab="Milk yield (observed and trend) per cow")

# Similar to Brandt Table 10
m1 <- aov(yield~period+group+cow:group+period:group, data=dat)
anova(m1)




