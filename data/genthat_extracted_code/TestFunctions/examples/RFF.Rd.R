library(TestFunctions)


### Name: RFF
### Title: Evaluate an RFF (random wave function) at given input
### Aliases: RFF

### ** Examples

curve(RFF(matrix(x,ncol=1),3,1,1,0))
curve(RFF(matrix(x,ncol=1),3,1,1,0, noise=.1), n=1e3, type='p', pch=19)

curve(RFF(matrix(x,ncol=1),c(3,20),c(1,.1),c(1,1),c(0,0)), n=1e3)



