library(snpar)


### Name: kde
### Title: Kernel Density and Distribution Estimation
### Aliases: kde
### Keywords: kde

### ** Examples


x <- rnorm(200,2,3)
# with default bandwidth
kde(x, kernel = "quar", plot = TRUE)

# with specified bandwidth
kde(x, h = 4, kernel = "quar", plot = TRUE)



