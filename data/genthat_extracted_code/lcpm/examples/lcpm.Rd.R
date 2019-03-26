library(lcpm)


### Name: lcpm
### Title: Fitting a Log Cumulative Probability Model
### Aliases: lcpm

### ** Examples

# Example below showing the use of y.order if outcome is not integers 1:J.
# See examples in ppm for an additional example


var_a <- c(rep(0,60),rep(1,60))
var_b <- c(rep(0,90),rep(1,30))
y1<-c(rep(2,5),rep(3,10),rep(5,5),rep(10,10),
rep(2,5),rep(3,10),rep(5,10),rep(10,5),
rep(2,10),rep(3,5),rep(5,5),rep(10,10),
rep(2,10),rep(3,5),rep(5,10),rep(10,5))

testdata<-data.frame(y=y1,var_a=var_a,var_b=var_b)

# LCPM estimates for non-proportional model
test1<-lcpm(y ~ var_a + var_b, data=testdata, y.order=c(2,3,5,10))
summary(test1)

# The proportional probability model used for the score test
summary(test1$proptest$propmodel)



