library(normalp)


### Name: summary.lmp
### Title: Summarize linear model fits with exponential power distribution
###   errors
### Aliases: summary.lmp print.summary.lmp
### Keywords: regression

### ** Examples

x<-runif(30)
e<-rnormp(30,0,3,1.25)
y<-0.5+x+e
L<-lmp(y~x)
summary(L)



