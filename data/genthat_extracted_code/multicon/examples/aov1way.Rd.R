library(multicon)


### Name: aov1way
### Title: One Way Anova
### Aliases: aov1way
### Keywords: anova one-way

### ** Examples

T1=rnorm(10,mean=1,sd=.5)
T2=rnorm(10,mean=1.1,sd=.45)
T3=rnorm(10,mean=1.2,sd=.4)
DVxIV=cbind(T1,T2,T3)
aov1way(DVxIV)




