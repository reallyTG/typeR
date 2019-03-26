library(PMmisc)


### Name: cv.lag
### Title: Create a lag variable
### Aliases: cv.lag

### ** Examples

cv.lag(mtcars[,2],3)
data.frame(mtcars,cv.lag(mtcars[,3], 1))



