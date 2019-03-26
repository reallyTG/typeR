library(agricolae)


### Name: simulation.model
### Title: Simulation of the linear model under normality
### Aliases: simulation.model
### Keywords: models

### ** Examples

library(agricolae)
#example 1
data(clay)
model<-"ralstonia ~ days"
simulation.model(model,clay,k=15,console=TRUE)
#example 2
data(sweetpotato)
model<-"yield~virus"
simulation.model(model,sweetpotato,categorical=1,k=15,console=TRUE)
#example 3
data(Glycoalkaloids)
model<-"HPLC ~ spectrophotometer"
simulation.model(model,Glycoalkaloids,k=15,console=TRUE)
#example 4
data(potato)
model<-"cutting~date+variety"
simulation.model(model,potato,categorical=c(1,2,3),k=15,console=TRUE)




