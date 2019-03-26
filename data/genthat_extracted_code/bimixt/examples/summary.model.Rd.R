library(bimixt)


### Name: summary.model
### Title: summary.model
### Aliases: summary.model

### ** Examples

case=rmix(50,10,1.2,15,1,.7) 
control=rmix(50,10,1.2,15,1,.95) 
model=bimixt.model(case=case,control=control, type="4c") 
summary(model)



