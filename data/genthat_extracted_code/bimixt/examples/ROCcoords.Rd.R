library(bimixt)


### Name: ROCcoords
### Title: ROCcoords
### Aliases: ROCcoords

### ** Examples

  cases=rmix(50,10,1.2,20,1.3,.7)
  controls=rmix(50,9,1.1,17,1.3,.95)
  model=bimixt.model(cases,controls,"4c")
  ROCcoords(model,x=.95,input="sens")
  ROCcoords(model,x=.95,input="spec")
  ROCcoords(model,x=9,input="thr")



