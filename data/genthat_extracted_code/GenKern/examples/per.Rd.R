library(GenKern)


### Name: per
### Title: Locate value for ith percentage point in a binned distribution
### Aliases: per
### Keywords: nonparametric

### ** Examples

# make up some x-y data
x <- seq(1,100)
y <- dnorm(x, mean=40, sd=10)
plot(x,y)                   
# mark the median, 0.1 and 0.9 positions with vertical lines
abline(v=per(y,x,0.5))
abline(v=per(y,x,0.9))
abline(v=per(y,x,0.1)) 
# for a bimodal distribution which doesn't sum to one
x <- c(1:5) 
y <- c(2,3,4,3,4)
per(y,x,0.5) # should return 3.25
# change the previous example to bin extremes
x <- c(1:6)
per(y,x,0.5) # should return 3.75



