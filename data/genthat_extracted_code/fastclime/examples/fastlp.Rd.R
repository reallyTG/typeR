library(fastclime)


### Name: fastlp
### Title: A generic LP solver
### Aliases: fastlp

### ** Examples

#generate an LP problem and solve it
A=matrix(c(-1,-1,0,1,-2,1),nrow=3)
b=c(-1,-2,1)
c=c(-2,3)
fastlp(c,A,b)



