library(MissMech)


### Name: TestUNey
### Title: Test of Goodness of Fit (Uniformity)
### Aliases: TestUNey SimNey

### ** Examples

# Example 1
x <- runif(100)
TestUNey(x, nrep = 10000, sim = NA)

# Example 2
x <- runif(30,2,5)
x <- (x-min(x))/(max(x)-min(x))
TestUNey(x, nrep = 10000, sim = NA)

# Example 3
x <- c(0.6,0.6,0.5,0.7,0.3,0.4,0.5,0.4,0.2,0.4,0.2,0.5,0.7,0.1,0.7,0.1,0.5,0.5,0.4,0.6,0.3)
TestUNey(x, nrep = 10000, sim = NA)



