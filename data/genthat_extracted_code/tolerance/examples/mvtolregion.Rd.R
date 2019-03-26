library(tolerance)


### Name: mvtol.region
### Title: Multivariate Normal Tolerance Regions
### Aliases: mvtol.region
### Keywords: file

### ** Examples
 
## 90%/90% bivariate normal tolerance region. 

set.seed(100)
x1 <- rnorm(100, 0, 0.2)
x2 <- rnorm(100, 0, 0.5)
x <- cbind(x1, x2)

out1 <- mvtol.region(x = x, alpha = 0.10, P = 0.90, B = 1000,
                     method = "KM")
out1
plottol(out1, x)

## 90%/90% trivariate normal tolerance region. 

set.seed(100)
x1 <- rnorm(100, 0, 0.2)
x2 <- rnorm(100, 0, 0.5)
x3 <- rnorm(100, 5, 1)
x <- cbind(x1, x2, x3)
mvtol.region(x = x, alpha = c(0.10, 0.05, 0.01), 
             P = c(0.90, 0.95, 0.99), B = 1000, method = "KM") 

out2 <- mvtol.region(x = x, alpha = 0.10, P = 0.90, B = 1000, 
                     method = "KM")
out2
plottol(out2, x)



