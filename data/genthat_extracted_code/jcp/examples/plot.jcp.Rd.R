library(jcp)


### Name: plot.jcp
### Title: plot.jcp
### Aliases: plot.jcp

### ** Examples

# Normal distributed sequence with 3 change points at
# c1=250 (change in expectation), 
# c2=500 (change in variance) and 
# c3=750 (change in expectation and variance) 
set.seed(0)
m      <- c(8,10,10,3);   s  <- c(4,4,10,5)
x      <- rnorm(1000, mean=rep(m,each=250), sd=rep(s,each=250))
result <- jcp(x)
summary(result)
plot(result)

# Set additional parameters (window set)
result2 <- jcp(x,H=c(80,160,240))
summary(result2)
plot(result2)




