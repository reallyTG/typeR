library(GPvam)


### Name: GPvam
### Title: Fitting the Generalized and Variable Persistence Models
### Aliases: GPvam
### Keywords: regression

### ** Examples

data(vam_data)
GPvam(vam_data,student.side="R",persistence="CP",
fixed_effects=formula(~as.factor(year)+cont_var+0),verbose=TRUE,max.iter.EM=1)
## No test: 
result <- GPvam(vam_data,student.side="R",persistence="VP",
fixed_effects=formula(~as.factor(year)+cont_var+0),verbose=TRUE)
 summary(result)

 plot(result)
## End(No test)



