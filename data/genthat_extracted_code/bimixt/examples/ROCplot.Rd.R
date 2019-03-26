library(bimixt)


### Name: ROCplot
### Title: ROCplot
### Aliases: ROCplot

### ** Examples

cases=rmix(50,10,1.2,20,1.3,.7)
controls=rmix(50,9,1.1,17,1.3,.95)
model=bimixt.model(cases,controls,"4c")
ROCplot(model)



