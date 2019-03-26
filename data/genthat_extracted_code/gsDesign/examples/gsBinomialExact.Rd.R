library(gsDesign)


### Name: gsBinomialExact
### Title: 3.4: One-Sample Binomial Routines
### Aliases: gsBinomialExact print.gsBinomialExact plot.gsBinomialExact
###   binomialSPRT plot.binomialSPRT nBinomial1Sample
### Keywords: design

### ** Examples


zz <- gsBinomialExact(k=3,theta=seq(0,1,0.1), n.I=c(12,24,36),
        a=c(-1, 0, 11),  b=c( 5, 9, 12))

# let's see what class this is
class(zz)

# because of "gsProbability" class above, following is equivalent to 
# print.gsProbability(zz)
zz
# also plot (see also plots below for \code{binomialSPRT})
# add lines using geom_line()
plot(zz) + geom_line()

# now for SPRT examples
x <- binomialSPRT(p0=.05,p1=.25,alpha=.1,beta=.2)
# boundary plot
plot(x)
# power plot
plot(x,plottype=2)
# Response (event) rate at boundary
plot(x,plottype=3)
# Expect sample size at boundary crossing or end of trial
plot(x,plottype=6)

# sample size for single arm exact binomial

# plot of table of power by sample size
nb1 <- nBinomial1Sample(p0 = 0.05, p1=0.2,alpha = 0.025, beta=.2, n = 25:40, outtype=3)
nb1
library(scales)
ggplot(nb1,aes(x=n,y=Power))+geom_line()+geom_point()+scale_y_continuous(labels=percent)

# simple call with same parameters to get minimum sample size yielding desired power
nBinomial1Sample(p0 = 0.05, p1=0.2,alpha = 0.025, beta=.2, n = 25:40)

# change to 'conservative' if you want all larger sample
# sizes to also provide adequate power
nBinomial1Sample(p0 = 0.05, p1=0.2,alpha = 0.025, beta=.2, n = 25:40, conservative=TRUE)

# print out more information for the selected derived sample size
nBinomial1Sample(p0 = 0.05, p1=0.2,alpha = 0.025, beta=.2, n = 25:40, conservative=TRUE,outtype=2)

# what happens if input sample sizes not sufficient?
nBinomial1Sample(p0 = 0.05, p1=0.2,alpha = 0.025, beta=.2, n = 25:30)





