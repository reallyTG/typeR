library(agridat)


### Name: patterson.switchback
### Title: A switchback trial in dairy cattle
### Aliases: patterson.switchback
### Keywords: datasets

### ** Examples


data(patterson.switchback)
dat <- patterson.switchback

# Create groupings for first treatment, second treatment
datp1 <- subset(dat, period=="P1")
datp2 <- subset(dat, period=="P2")
dat$p1trt <- datp1$trt[match(dat$cow, datp1$cow)]
dat$p2trt <- datp2$trt[match(dat$cow, datp2$cow)]
                     
if(require(latticeExtra)){
  useOuterStrips(xyplot(y ~ period|p1trt*p2trt, data=dat,
                        group=cow, type=c('l','r'),
                        auto.key=list(columns=5),
                        main="patterson.switchback",
                        xlab="First/Third period treatment", 
                        ylab="Second period treatment"))
}

# Create a numeric period variable
dat$per <- as.numeric(substring(dat$period,2))

# Need to use 'terms' to preserve the order of the model terms
m1 <- aov(terms(y ~ cow + per:cow + period + trt, keep.order=TRUE), data=dat)
anova(m1) # Match table 2 of Lowry
## Analysis of Variance Table
##           Df Sum Sq Mean Sq F value    Pr(>F)
## cow       11 3466.0 315.091 57.1773 2.258e-06 ***
## cow:per   12  953.5  79.455 14.4182 0.0004017 ***
## period     1   19.7  19.740  3.5821 0.0950382 .
## trt        3   58.3  19.418  3.5237 0.0685092 .
## Residuals  8   44.1   5.511




