library(GPvam)


### Name: plot
### Title: Plot method for GPvam
### Aliases: plot.GPvam
### Keywords: regression

### ** Examples

data(vam_data)
## No test: 
GPvam(vam_data,student.side="R",persistence="VP",
fixed_effects=formula(~as.factor(year)+cont_var+0),verbose=TRUE,max.iter.EM=1)
## No test: 
result <- GPvam(vam_data,student.side="R",persistence="VP",
fixed_effects=formula(~as.factor(year)+cont_var+0),verbose=TRUE)
 summary(result)

 plot(result)
## End(No test)                
## End(No test)



