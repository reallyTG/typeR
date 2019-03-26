library(bimixt)


### Name: bimixt.model
### Title: bimixt.model
### Aliases: bimixt.model

### ** Examples

case=rmix(50,10,1.2,15,1,.7) 
control=rmix(50,10,1.2,15,1,.95) 
model1=bimixt.model(case=case, control=control, type="4c", start.vals=list(mu.cs=c(10,15), 

mu.ctrl=c(10,15),sig.cs=c(1.2,1),sig.ctrl=c(1.2,1),pi.cs=c(.7,.3),pi.ctrl=c(.95,.05))) 
model2=bimixt.model(case=case, control=control, type="2cu")  
model3=bimixt.model(case=case, control=control, type="2cc") 
model4=bimixt.model(case=case, control=control, type="binorm") 



