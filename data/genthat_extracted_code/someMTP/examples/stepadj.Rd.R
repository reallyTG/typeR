library(someMTP)


### Name: step.adj
### Title: Multipicity correction for Stepwise Selected models
### Aliases: step.adj
### Keywords: htest

### ** Examples

set.seed(17)
y=rnorm(10)
x=matrix(rnorm(50),10,5)
#define a data.frame to be used in the glm function
DATA=data.frame(y,x)
#fit the model on a toy dataset
mod=glm(y~X1+X2+X3+X4+X5,data=DATA)

#select the model using function step
mod.step=step(mod, trace=0)
#test the selected model vs the null model
anova(glm(y~1, data=DATA),mod.step,test="F")

#step.adj do the same, but it also provides multiplicity control
step.adj(mod,MC=101, trace=0)



