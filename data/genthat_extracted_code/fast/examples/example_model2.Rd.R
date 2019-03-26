library(fast)


### Name: example_model2
### Title: Functions to demonstrate FAST
### Aliases: example_model2 example_model1
### Keywords: utilities datagen

### ** Examples

example_model1(par=c(0.5,0.5,0.5),a=c(1,1,1))

#The model depends on 4 parameters
#
#It produces a weighted sum of the 4 parameters and returns this sum
#
#The weights depend on an additional parameter x=1:200 
example_model2(p=c(1,3,1,1),fig=TRUE)
example_model2(p=c(1,2,2,3),fig=TRUE)



