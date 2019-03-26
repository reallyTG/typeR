library(fastclime)


### Name: paralp
### Title: A solver for parameterized LP problems
### Aliases: paralp

### ** Examples

#generate an LP problem and solve it
A=matrix(c(-1,-1,0,1,-2,1),nrow=3)
b=c(-1,-2,1)
c=c(-2,3)
b_bar=c(1,1,1)
c_bar=c(1,1)
paralp(c,A,b,c_bar,b_bar)



