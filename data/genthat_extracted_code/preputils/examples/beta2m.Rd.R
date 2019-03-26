library(preputils)


### Name: beta2m
### Title: Convert proportional data to M-Values
### Aliases: beta2m

### ** Examples

    a <- sapply(c(0.01,0.05,0.5,0.8,0.9),function(x) rbinom(30,100,x)/100)
    matplot(a,pch=20)
    matplot(beta2m(a),pch=20)
    matplot(a,beta2m(a),pch=20)



