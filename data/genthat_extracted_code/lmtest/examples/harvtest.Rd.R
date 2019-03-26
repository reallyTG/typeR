library(lmtest)


### Name: harvtest
### Title: Harvey-Collier Test
### Aliases: harvtest
### Keywords: htest

### ** Examples

# generate a regressor and dependent variable
x <- 1:50
y1 <- 1 + x + rnorm(50)
y2 <- y1 + 0.3*x^2

## perform Harvey-Collier test
harv <- harvtest(y1 ~ x)
harv
## calculate critical value vor 0.05 level
qt(0.95, harv$parameter)
harvtest(y2 ~ x)



