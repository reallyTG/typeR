library(forecast)


### Name: seasadj
### Title: Seasonal adjustment
### Aliases: seasadj seasadj.stl seasadj.mstl seasadj.decomposed.ts
###   seasadj.tbats seasadj.seas
### Keywords: ts

### ** Examples

plot(AirPassengers)
lines(seasadj(decompose(AirPassengers,"multiplicative")),col=4)




