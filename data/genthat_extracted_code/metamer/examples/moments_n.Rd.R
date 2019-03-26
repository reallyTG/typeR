library(metamer)


### Name: moments_n
### Title: Compute moments
### Aliases: moments_n

### ** Examples

data <- data.frame(x = rnorm(100), y = rnorm(100))
moments_3 <- moments_n(1:3)

moments_3(data)

moments_3 <- moments_n(1:3, "x")
moments_3(data)




