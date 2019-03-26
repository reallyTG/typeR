library(gets)


### Name: periodicdummies
### Title: Make matrix of periodicity (e.g. seasonal) dummies
### Aliases: periodicdummies
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##quarterly dummies:
x <- zooreg(rnorm(30), start=2000, frequency=4)
periodicdummies(x)

##monthly dummies:
y <- zooreg(rnorm(30), start=c(2000,1), frequency=12)
periodicdummies(y)




