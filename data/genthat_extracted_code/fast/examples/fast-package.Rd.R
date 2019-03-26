library(fast)


### Name: fast-package
### Title: Implementation of the Fourier Amplitute Sensitivity Test (FAST)
### Aliases: fast-package fast
### Keywords: package utilities misc multivariate

### ** Examples

#A simple model depending on two
#parameters and an additional
#"hyperparameter" x. Depending on
#x the model is sensitive to p[1] only (x=1) 
#or p[2] only (x=0) or both (0<x<1)

example_model1<-function(p,x){
   return(p[1]*x+p[2]*(1-x))
}
paras<-fast_parameters(minimum=c(0,0,0),maximum=c(1,1,1))
paras
model_results <- apply(paras, 1, example_model1, x=0.5)
plot(model_results)
sensitivity <- sensitivity(x=model_results, numberf=3, make.plot=TRUE)
sensitivity


#In the second example, sensitivities are calculated for
#200 model results (which might be a time series).
#
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
plot(model_results)
dev.new()
sensitivity <- sensitivity_rep(data = model_results, xval=1:200, direction = 1, order=4 , numberf=4)
p.sensitivity(sen=sensitivity, xval=1:200, legend=names(paras))




