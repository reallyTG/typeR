library(bimixt)


### Name: bimixt-package
### Title: bimixt
### Aliases: bimixt-package bimixt
### Keywords: package

### ** Examples

case=rmix(50,10,1.2,15,1,.7)
control=rmix(50,10,1.2,15,1,.95)
model1=bimixt.model(case=case,control=control, type="4c")
model2=bimixt.model(case=case, control=control, type="2cu") 
model3=bimixt.model(case=case, control=control, type="2cc")
model4=bimixt.model(case=case, control=control, type="binorm")
par(mfrow=c(2,2))
plot(model1)
plot(model2)
plot(model3)
plot(model4)



