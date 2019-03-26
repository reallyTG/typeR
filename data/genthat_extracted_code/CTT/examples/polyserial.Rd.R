library(CTT)


### Name: polyserial
### Title: Function for calculating polyserial correlations
### Aliases: polyserial
### Keywords: misc

### ** Examples

x <- rnorm(500, 50,5)
y <- x + rnorm(500,0,2)
x <- x + rnorm(500,0,2)
cor(x,y)

y <- ifelse(y>50,1,0)

cor(x,y)

polyserial(x,y, ml=FALSE)
polyserial(x,y)



