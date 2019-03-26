library(SUE)


### Name: SUE.plot
### Title: Plot for "SUE.lm" Objects
### Aliases: SUE.plot
### Keywords: ~kwd1

### ** Examples

## We analysis the well-known stackloss data by using the subsampling method.

data(stackloss)
a=SUE.lm(stack.loss~Air.Flow+Water.Temp+Acid.Conc.,data=stackloss,k=57,ns=11,r=6, 
	consistency.check=TRUE,constant=0.25)
SUE.plot(a)



