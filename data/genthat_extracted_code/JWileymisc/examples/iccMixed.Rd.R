library(JWileymisc)


### Name: iccMixed
### Title: Intraclass Correlation Coefficient (ICC) from Mixed Models
### Aliases: iccMixed
### Keywords: multivariate

### ** Examples

iccMixed("mpg", "cyl", mtcars)
iccMixed("mpg", "cyl", as.data.table(mtcars))
iccMixed("mpg", "cyl", as.data.table(mtcars), family = "gaussian")
iccMixed("mpg", c("cyl", "am"), as.data.table(mtcars))
iccMixed("am", "cyl", as.data.table(mtcars), family = "binomial")



