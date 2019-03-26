library(agridat)


### Name: lucas.switchback
### Title: Switchback trial in dairy with three treatments
### Aliases: lucas.switchback
### Keywords: datasets

### ** Examples


data(lucas.switchback)
dat <- lucas.switchback

# Create a numeric period variable
dat$per <- as.numeric(substring(dat$period,2))

require(lattice)
xyplot(yield ~ period|block, data=dat, group=cow, type=c('l','r'),
       auto.key=list(columns=6),
       main="lucas.switchback - (actually uniformity data)")

# Need to use 'terms' to preserve the order of the model terms
# Really, cow(block), per:cow(block), period(block)
m1 <- aov(terms(yield ~ block + cow:block + per:cow:block +
                period:block + trt, keep.order=TRUE), data=dat)
anova(m1) # Match Sanders & Gaynor table 3
## Analysis of Variance Table
##               Df  Sum Sq Mean Sq F value    Pr(>F)
## block          2   30.93  15.464  55.345 5.132e-05 ***
## block:cow      9 1700.97 188.997 676.426 1.907e-09 ***
## block:cow:per 12  120.47  10.040  35.932 4.137e-05 ***
## block:period   3   14.85   4.950  17.717  0.001194 **
## trt            2    1.58   0.789   2.825  0.126048
## Residuals      7    1.96   0.279

coef(m1) # trtT2 and trtT3 match Sanders table 3 trt diffs




