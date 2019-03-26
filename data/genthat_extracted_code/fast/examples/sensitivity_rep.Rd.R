library(fast)


### Name: sensitivity_rep
### Title: Repeat calculation of sensitivities for lots of data
### Aliases: sensitivity_rep
### Keywords: utilities

### ** Examples

#The model depends on 4 parameters
#
#It produces a weighted sum of the 4 parameters and returns this sum
#
#The weights depend on an additional parameter x=1:200 
example_model2(p=c(1,3,1,1),fig=TRUE)
example_model2(p=c(1,2,2,3),fig=TRUE)
paras<-fast_parameters(min=c(0,0,0,0),max=c(1,2,2,3))
paras
model_results <- apply(paras, 1, example_model2)
model_results
sensitivity <- sensitivity_rep(data = model_results, xval=1:200, direction = 1, order=4 , numberf=4)
p.sensitivity(sen=sensitivity, xval=1:200, legend=names(paras))

#Alternatively with zoo object
result.zoo <- zoo(model_results, order.by=1:200)
sensitivity <- sensitivity_rep(data.zoo = result.zoo, numberf=4)




