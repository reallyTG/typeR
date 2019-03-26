library(lcpm)


### Name: ppm
### Title: Fitting a Proportional Probability Model
### Aliases: ppm

### ** Examples

# 2 examples below showing the use of y.order if outcome are not integers 1:J.

# Example 1:

var_a <- c(rep(0,60),rep(1,60))
var_b <- c(rep(0,90),rep(1,30))
y1<-c(rep(2,5),rep(3,10),rep(5,5),rep(10,10),
rep(2,5),rep(3,10),rep(5,10),rep(10,5),
rep(2,10),rep(3,5),rep(5,5),rep(10,10),
rep(2,10),rep(3,5),rep(5,10),rep(10,5))

testdata<-data.frame(y=y1,var_a=var_a,var_b=var_b)

# PPM estimates for proportional model
test1<-ppm( y ~ var_a + var_b, data=testdata, y.order=c(2,3,5,10))
summary(test1)

# Example 2:

y2<-c(rep("a",5),rep("b",10),rep("c",5),rep("d",10),
rep("a",5),rep("b",10),rep("c",10),rep("d",5),
rep("a",10),rep("b",5),rep("c",5),rep("d",10),
rep("a",10),rep("b",5),rep("c",10),rep("d",5))
testdata2<-data.frame(y=y2,var_a=var_a,var_b=var_b)
test2<-ppm(y~var_a + var_b , data=testdata2, y.order=c("a","b","c","d"))
summary(test2)



