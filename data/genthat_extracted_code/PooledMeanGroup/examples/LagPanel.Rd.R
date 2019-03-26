library(PooledMeanGroup)


### Name: LagPanel
### Title: LagPanel
### Aliases: LagPanel

### ** Examples

# first import DataExp, i=1...9, T1=T2=...T9=35
data(DataExp)
DataExp[1:5,]
# then execute LagPanel
y10=data.frame(y10=DataExp[,1], row.names=row.names(DataExp))
ly10=LagPanel(variable=y10, quantity=rep(35,9))
ldebt=LagPanel(variable=DataExp[,4], quantity=rep(35,9))
cbind(y10,ly10,ldebt)[1:5,]



