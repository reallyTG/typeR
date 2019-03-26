library(DiscreteLaplace)


### Name: ddlaplace
### Title: Probability mass function, cumulative distribution function,
###   quantile function and random generation of the DSL
### Aliases: ddlaplace pdlaplace qdlaplace rdlaplace
### Keywords: distribution

### ** Examples

# pmf
p<-0.7
q<-0.45
x<--10:10
prob<-ddlaplace(x, p, q)
plot(x, prob, type="h")
prob<-ddlaplace(x, q, p) # swap the parameters
plot(x, prob, type="h")
ddlaplace(-4:4, 1:9/10, 9:1/10) # letting p and q be vectors
# cdf
p<-0.2
q<-0.5
x<-c(-3, -1, pi)
pdlaplace(x, p, q)
# quantile function
p<-0.8
q<-0.4
prob<-c(0.2,0.5,0.8)
x<-qdlaplace(prob, p, q)
x # check
upper<-pdlaplace(x, p, q)
upper
lower<-pdlaplace(x-1, p, q)
lower
lower<=prob & prob<=upper
# random generation
n<-100
p<-0.3
q<-0.5
x<-rdlaplace(n, p, q)
x
t<-table(x)
t
plot(t)



