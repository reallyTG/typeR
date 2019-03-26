library(agridat)


### Name: crampton.pig
### Title: Weight gain in pigs for different treatments
### Aliases: crampton.pig
### Keywords: datasets

### ** Examples


data(crampton.pig)
dat <- crampton.pig

dat <- transform(dat, gain=weight2-weight1)
require(lattice)
# Trt 4 looks best
xyplot(gain ~ feed, dat, group=treatment, type=c('p','r'),
       auto.key=list(columns=5),
       xlab="Feed eaten", ylab="Weight gain", main="crampton.pig")

# Basic Anova without covariates
m1 <- lm(weight2 ~ treatment + rep, data=dat)
anova(m1)
# Add covariates
m2 <- lm(weight2 ~ treatment + rep + weight1 + feed, data=dat)
anova(m2)
# Remove treatment, test this nested model for significant treatments
m3 <- lm(weight2 ~ rep + weight1 + feed, data=dat)
anova(m2,m3) # p-value .07. F=2.34 matches Ostle




