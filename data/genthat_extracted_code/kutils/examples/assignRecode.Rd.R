library(kutils)


### Name: assignRecode
### Title: A variable is transformed in an indicated way
### Aliases: assignRecode

### ** Examples

set.seed(234234)
x <- rpois(100, lambda = 3)
x <- x[order(x)]
str1 <- "log(x + 1)"
xlog <- assignRecode(x, recode = str1)
plot(xlog ~ x, type = "l")
mean(xlog, na.rm = TRUE)
str2 <- "x^2"
xsq <- assignRecode(x, recode = str2)
plot(xsq ~ x, type = "l")
str3 <- "sqrt(x)"
xsrt <- assignRecode(x, recode = str3)



