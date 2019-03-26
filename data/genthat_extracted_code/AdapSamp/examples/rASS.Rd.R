library(AdapSamp)


### Name: rASS
### Title: Adaptive Slice Sampling Algorithm With Stepping-Out Procedures
### Aliases: rASS

### ** Examples


# Example 1: Sampling from exponential distribution with bounded domain
x<-rASS(100,-1,"1.114283*exp(-(4-x^2)^2)",3)
plot(density(x))




