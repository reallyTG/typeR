library(ALSM)


### Name: towway.ci
### Title: Confidence intervals for tow way ANOVA
### Aliases: towway.ci

### ** Examples

library('ALSM')
y=HayFeverRelief$y
A=HayFeverRelief$A
B=HayFeverRelief$B

m=matrix(c(1,2,3,0,0,0,.5,-1,.5),byrow = TRUE,nrow = 3)
towway.ci(y,A,B,mc=m)



