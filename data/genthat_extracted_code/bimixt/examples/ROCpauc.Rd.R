library(bimixt)


### Name: ROCpauc
### Title: ROCpauc
### Aliases: ROCpauc

### ** Examples

cases=rmix(50,10,1.2,20,1.3,.7)
controls=rmix(50,9,1.1,17,1.3,.95)
model= bimixt.model(cases,controls,"4c") 
ROCpauc(model, spec.lower = .85, spec.upper = 1)



