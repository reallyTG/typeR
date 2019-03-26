library(gsDesign)


### Name: sfLinear
### Title: 4.6: Piecewise Linear and Step Function Spending Functions
### Aliases: sfLinear sfStep
### Keywords: design

### ** Examples

# set up alpha spending and beta spending to be piecewise linear
sfupar <- c(.2, .4, .05, .2)
sflpar <- c(.3, .5, .65, .5, .75, .9)
x <- gsDesign(sfu=sfLinear, sfl=sfLinear, sfupar=sfupar, sflpar=sflpar)
plot(x, plottype="sf")
x

# now do an example where there is no lower-spending at interim 1
# and no upper spending at interim 2
sflpar<-c(1/3,2/3,0,.25)
sfupar<-c(1/3,2/3,.1,.1)
x <- gsDesign(sfu=sfLinear, sfl=sfLinear, sfupar=sfupar, sflpar=sflpar)
plot(x, plottype="sf")
x

# now do an example where timing of interims changes slightly, but error spending does not
# also, spend all alpha when at least >=90 percent of final information is in the analysis
sfupar=c(.2,.4,.9,((1:3)/3)^3)
x <- gsDesign(k=3,n.fix=100,sfu=sfStep,sfupar=sfupar,test.type=1)
plot(x,pl="sf")
# original planned sample sizes
ceiling(x$n.I)
# cumulative spending planned at original interims
cumsum(x$upper$spend)
# change timing of analyses; 
# note that cumulative spending "P(Cross) if delta=0" does not change from cumsum(x$upper$spend)
# while full alpha is spent, power is reduced by reduced sample size
y <- gsDesign(k=3, sfu=sfStep, sfupar=sfupar, test.type=1,
              maxn.IPlan=x$n.I[x$k], n.I=c(30,70,95),
              n.fix=x$n.fix)
# note that full alpha is used, but power is reduced due to lowered sample size
gsBoundSummary(y)

# now show how step function can be abused by 'adapting' stage 2 sample size based on interim result
x <- gsDesign(k=2,delta=.05,sfu=sfStep,sfupar=c(.02,.001),timing=.02,test.type=1)
# spending jumps from miniscule to full alpha at first analysis after interim 1
plot(x, pl="sf")
# sample sizes at analyses:
ceiling(x$n.I)
# simulate 1 million stage 1 sum of 178 Normal(0,1) random variables 
# Normal(0,Variance=178) under null hypothesis
s1 <- rnorm(1000000,0,sqrt(178))
# compute corresponding z-values
z1 <- s1/sqrt(178)
# set stage 2 sample size to 1 if z1 is over final bound, otherwise full sample size
n2 <- array(1,1000000)
n2[z1<1.96]<- ceiling(x$n.I[2])-ceiling(178)
# now sample n2 observations for second stage
s2 <- rnorm(1000000,0,sqrt(n2))
# add sum and divide by standard deviation
z2 <- (s1+s2)/(sqrt(178+n2))
# By allowing full spending when final analysis is either 
# early or late depending on observed interim z1, 
# Type I error is now almost twice the planned .025
sum(z1 >= x$upper$bound[1] | z2 >= x$upper$bound[2])/1000000
# if stage 2 sample size is random and independent of z1 with same frequency, 
# this is not a problem
s1alt <- rnorm(1000000,0,sqrt(178))
z1alt <- s1alt / sqrt(178)
z2alt <- (s1alt+s2)/sqrt(178+n2)
sum(z1alt >= x$upper$bound[1] | z2alt >= x$upper$bound[2])/1000000



