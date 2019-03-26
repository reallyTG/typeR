library(AdapSamp)


### Name: rARS
### Title: Adaptive Rejection Sampling Algorithm
### Aliases: rARS

### ** Examples


# Example 1: Standard normal distribution
x1 <- rARS(100,"exp(-x^2/2)",-Inf,Inf,c(-2,2))

# Example 2: Truncated normal distribution
x2 <- rARS(100,"exp(-x^2/2)",-2.1,2.1,c(-2,2))

# Example 3: Normal distribution with mean=2 and sd=2
x3 <- rARS(100,"exp(-(x-2)^2/(2*4))",-Inf,Inf,c(-3,3))

# Example 4: Exponential distribution with rate=3
x4 <- rARS(100,"exp(-3*x)",0,Inf,c(2,3,100))

# Example 5: Beta distribution with alpha=3 and beta=4
x5 <- rARS(100,"x^2*(1-x)^3",0,1,c(0.4,0.6))

# Example 6: Gamma distribution with alpha=5 and lambda=2
x6 <- rARS(100,"x^(5-1)*exp(-2*x)",0,Inf,c(1,10))

# Example 7: Student distribution with df=10
x7 <- rARS(100,"(1+x^2/10)^(-(10+1)/2)",-Inf,Inf,c(-10,2))

# Example 8: F distribution with m=10 and n=5
x8 <- rARS(100,"x^(10/2-1)/(1+10/5*x)^(15/2)",0,Inf,c(3,10))

# Example 9:Cauchy distribution
x9 <- rARS(100,"1/(1+(x-1)^2)",-Inf,Inf,c(-2,2,10))

# Example 10:Rayleigh distribution with lambda=1
x10 <- rARS(100,"2*x*exp(-x^2)",0,Inf,c(0.01,10))




