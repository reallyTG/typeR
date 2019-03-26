library(nlr)


### Name: nl.lmsGA
### Title: Fitt a nonlinear regression model by least median of squares.
###   The Optimization is done by genetic algorithm.
### Aliases: nl.lmsGA
### Keywords: least median square estimate ordinary least square genetic
###   algorithm

### ** Examples

  # chicken data fitt example
  data=list(xr=Weights$Date,yr=Weights$Weight)
  fit<- nl.lmsGA(nlrobj1[[14]],data=data,start=list(p1=100,p2=42,p3=.11))



