library(ClassComparison)


### Name: SingleGroup-class
### Title: Class "SingleGroup"
### Aliases: SingleGroup SingleGroup-class as.data.frame,SingleGroup-method
###   plot,SingleGroup,missing-method print,SingleGroup-method
###   show,SingleGroup-method summary,SingleGroup-method
### Keywords: classes loess

### ** Examples

showClass("SingleGroup")
m <- rnorm(1000, 8, 2.5)
v <- rnorm(1000, 0.7)
plot(m, v)

x <- SingleGroup(m, v, name='bogus')

summary(x)

plot(x)
plot(x, multiple=2)



