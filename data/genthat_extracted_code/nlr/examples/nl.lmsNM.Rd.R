library(nlr)


### Name: nl.lmsNM
### Title: Fitt a nonlinear regression model by least median of squares.
###   The Optimization is done by golden section method.
### Aliases: nl.lmsNM
### Keywords: least median square estimate ordinary least square genetic
###   algorithm

### ** Examples

  # chicken data fitt example
  data=list(xr=Weights$Date,yr=Weights$Weight)
  fit<- nl.lmsNM(nlrobj1[[14]],data=data,start=list(p1=1000,p2=42,p3=.11))
  fit



