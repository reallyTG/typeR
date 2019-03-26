library(PooledMeanGroup)


### Name: DiffPanel
### Title: DiffPanel
### Aliases: DiffPanel

### ** Examples

# first import DataExp, i=1...9, T1=T2=...T9=35
data(DataExp)
DataExp[1:5,]
# then execute DiffPanel
y10=data.frame(y10=DataExp[,1], row.names=row.names(DataExp))
dy10=DiffPanel(variable=y10, quantity=rep(35,9))
diip=DiffPanel(variable=DataExp[,11], quantity=rep(35,9))
cbind(y10,dy10,diip)[1:5,]



