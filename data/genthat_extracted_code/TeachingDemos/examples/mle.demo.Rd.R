library(TeachingDemos)


### Name: mle.demo
### Title: Demonstrate the basic concept of Maximum Likelihood Estimation
### Aliases: mle.demo
### Keywords: iplot dynamic

### ** Examples


if(interactive()){
mle.demo()

m <- runif(1, 50,100)
s <- runif(1, 1, 10)
x <- rnorm(15, m, s)

mm <- mean(x)
ss <- sqrt(var(x))
ss2 <- sqrt(var(x)*11/12)
mle.demo(x)
# now find the mle from the graph and compare it to mm, ss, ss2, m, and s
}



