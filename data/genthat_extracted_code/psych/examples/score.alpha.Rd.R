library(psych)


### Name: score.alpha
### Title: Score scales and find Cronbach's alpha as well as associated
###   statistics
### Aliases: score.alpha
### Keywords: multivariate models

### ** Examples


y <- attitude     #from the datasets package
keys <- matrix(c(rep(1,7),rep(1,4),rep(0,7),rep(-1,3)),ncol=3)
labels <- c("first","second","third")
x <- score.alpha(keys,y,labels) #deprecated





