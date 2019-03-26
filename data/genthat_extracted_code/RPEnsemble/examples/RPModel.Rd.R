library(RPEnsemble)


### Name: RPModel
### Title: Generate pairs '(x,y)' from joint distribution
### Aliases: RPModel

### ** Examples

Data <- RPModel(Model.No = 1, 100, 100, Pi = 1/2)
table(Data$y)
colMeans(Data$x[Data$y==1,])
colMeans(Data$x[Data$y==2,])



