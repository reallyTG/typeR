library(agricolae)


### Name: resampling.model
### Title: Resampling for linear models
### Aliases: resampling.model
### Keywords: multivariate

### ** Examples

#example 1 Simple linear regression
library(agricolae)
data(clay)
model<-"ralstonia ~ days"
analysis<-resampling.model(model,clay,k=2,console=TRUE)

#example 2 Analysis of variance: RCD
data(sweetpotato)
model<-"yield~virus"
analysis<-resampling.model(model,sweetpotato,k=2,console=TRUE)

#example 3 Simple linear regression
data(Glycoalkaloids)
model<-"HPLC ~ spectrophotometer"
analysis<-resampling.model(model,Glycoalkaloids,k=2,console=TRUE)

#example 4 Factorial in RCD

data(potato)
potato[,1]<-as.factor(potato[,1])
potato[,2]<-as.factor(potato[,2])
model<-"cutting~variety + date + variety:date"
analysis<-resampling.model(model,potato,k=2,console=TRUE)




