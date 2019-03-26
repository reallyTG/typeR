library(sensors4plumes)


### Name: summaryLocations
### Title: Summarise values of Simulations by locations
### Aliases: summaryLocations

### ** Examples

data(radioactivePlumes) 
plumeSample =  c(1:5, 16:20, 30:34, 45:49)# sample of plumes: jan, apr, jul, oct

# plume detection 
# (number of plumes in plumeSample that can be detected at a level of more than 1e-7)
detection1em7 = function(x, ...){
  xExceed = x > 1e-7
  out = sum(xExceed)
  return(out)
}
plumeNr_radioactivePlumes = 
  summaryLocations(radioactivePlumes, 
                   plumes = plumeSample, fun = detection1em7, kinds = 2)
## plot map
plumeNrMap = radioactivePlumes@locations
plumeNrMap@data$plumeNr = plumeNr_radioactivePlumes[["summaryLocations"]]
spplot(plumeNrMap, zcol = "plumeNr")



