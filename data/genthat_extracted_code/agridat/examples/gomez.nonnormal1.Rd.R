library(agridat)


### Name: gomez.nonnormal1
### Title: Insecticide treatment effectiveness
### Aliases: gomez.nonnormal1
### Keywords: datasets

### ** Examples

data(gomez.nonnormal1)
dat <- gomez.nonnormal1

# Gomez figure 7.3
## require(dplyr)
## dat2 <- dat %>% group_by(trt)
## dat2 <- summarize(dat2, mn=mean(larvae), rng=diff(range(larvae)))
## plot(rng ~ mn, data=dat2,
##      xlab="mean number of larvae", ylab="range of number of larvae",
##      main="gomez.nonnormal1")


# Because some of the original values are less than 10,
# the transform used is log10(x+1) instead of log10(x).
dat <- transform(dat, tlarvae=log10(larvae+1))

# QQ plots for raw/transformed data
if(require(reshape2) & require(lattice))
  qqmath( ~ value|variable, data=melt(dat),
         main="gomez.nonnormal1 - raw/transformed QQ plot",
         scales=list(relation="free"))

# Gomez table 7.16
m1 <- lm(tlarvae ~ rep + trt, data=dat)
anova(m1)
## Response: tlarvae
##           Df Sum Sq Mean Sq F value    Pr(>F)    
## rep        3 0.9567 0.31889  3.6511 0.0267223 *  
## trt        8 3.9823 0.49779  5.6995 0.0004092 ***
## Residuals 24 2.0961 0.08734




