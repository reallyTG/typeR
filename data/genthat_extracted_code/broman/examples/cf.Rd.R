library(broman)


### Name: cf
### Title: Compare objects, including missing data pattern
### Aliases: cf cf.default cf.list
### Keywords: data

### ** Examples

x <- c(5, 8, 9, NA, 3, NA)
y <- c(5, 2, 9, 4, NA, NA)
cf(x,y)

x <- matrix(rnorm(1000), ncol=20)
x[sample(seq(along=x), 100)] <- NA
all(cf(x,x))
dim(cf(x,x))

y <- x
y[4,8] <- NA
sum(!cf(x,y))
y[6,2] <- 18
sum(!cf(x,y))
y[6,5] <- 32
sum(!cf(x,y))

x <- as.data.frame(x)
y <- as.data.frame(y)
sum(!cf(x,y))

x <- as.list(x)
y <- as.list(y)
sapply(cf(x,y), function(a) sum(!a))




