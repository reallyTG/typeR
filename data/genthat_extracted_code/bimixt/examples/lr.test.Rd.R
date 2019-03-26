library(bimixt)


### Name: lr.test
### Title: lr.test
### Aliases: lr.test

### ** Examples

case=rmix(50,10,1.2,15,1,.7) 
control=rmix(50,10,1.2,15,1,.95) 
model1=bimixt.model(case=case,control=control, type="4c") 
model2=bimixt.model(case=case,control=control, type="binorm") 
lr.test(model1, model2)
 


