library(TestFunctions)


### Name: RFF_get
### Title: Create a new RFF function
### Aliases: RFF_get

### ** Examples

func <- RFF_get(D=1)
curve(func)

f <- RFF_get(D=1, noise=.1)
curve(f(matrix(x,ncol=1)))
for(i in 1:100) curve(f(matrix(x,ncol=1)), add=TRUE, col=sample(2:8,1))



