library(DescTools)


### Name: Extremes
### Title: Kth Smallest/Largest Values
### Aliases: Large Small HighLow
### Keywords: arith

### ** Examples

x <- sample(1:10, 1000, rep=TRUE)
Large(x, 3)
Large(x, k=3, unique=TRUE)

# works fine up to x ~ 1e6
x <- runif(1000000)
Small(x, 3, unique=TRUE)
Small(x, 3, unique=FALSE)

# Both ends
cat(HighLow(d.pizza$temperature, na.last=NA))




