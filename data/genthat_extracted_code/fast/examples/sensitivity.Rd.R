library(fast)


### Name: sensitivity
### Title: Calculate sensitivity according to the FAST algorithm
### Aliases: sensitivity
### Keywords: utilities

### ** Examples

example_model1<-function(p,x){
   return(p[1]*x+p[2]*(1-x))
}
paras<-fast_parameters(min=c(0,0,0),max=c(1,2,2))
paras
model_results <- apply(paras, 1, example_model1, x=0.5)
model_results
sensitivity <- sensitivity(x=model_results, numberf=3, make.plot=TRUE)
sensitivity



