library(DiscreteLaplace)


### Name: ddlaplace2
### Title: Probability mass function of the ADSL
### Aliases: ddlaplace2 pdlaplace2 qdlaplace2 rdlaplace2 palaplace2
### Keywords: distribution

### ** Examples

# pmf
p <- 0.7
q <- 0.45
x <- -10:10
prob <- ddlaplace2(x, p, q)
plot(x, prob, type="h")
# swap the parameters
prob <- ddlaplace2(x, q, p)
plot(x, prob, type="h")
# letting p and q be vectors...
ddlaplace2(-4:4, 1:9/10, 9:1/10)
# cdf
pdlaplace2(x, p, q)
pdlaplace2(pi, p, q)
pdlaplace2(floor(pi), p, q)
# quantile function
qdlaplace(1:9/10, p, q)
# random generation
y <- rdlaplace2(n=1000, p, q)
plot(table(y))



