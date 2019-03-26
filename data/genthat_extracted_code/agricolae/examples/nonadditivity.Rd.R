library(agricolae)


### Name: nonadditivity
### Title: Nonadditivity model test
### Aliases: nonadditivity
### Keywords: models

### ** Examples

library(agricolae)
data(potato )
potato[,1]<-as.factor(potato[,1])
model<-lm(cutting ~ date + variety,potato)
df<-df.residual(model)
MSerror<-deviance(model)/df
analysis<-with(potato,nonadditivity(cutting, date, variety, df, MSerror))



