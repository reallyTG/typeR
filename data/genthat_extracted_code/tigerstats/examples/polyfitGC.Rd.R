library(tigerstats)


### Name: polyfitGC
### Title: Polynomial Regression
### Aliases: polyfitGC

### ** Examples

#To study the relationship between two numerical variables:
polyfitGC(mpg~wt,data=mtcars,degree=2,graph=TRUE)
#check the second-fdegree fit:
polyfitGC(mpg~wt,data=mtcars,degree=2,check=TRUE)



