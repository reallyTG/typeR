library(PooledMeanGroup)


### Name: optimPMG
### Title: optimPMG
### Aliases: optimPMG

### ** Examples

# first import DataExp, i=1...9, T1=T2=...T9=35
data(DataExp)
DataExp[1:5,]
# then prepare lags and diffs using LagPanel and DiffPanel
y10=data.frame(y10=DataExp[,1], row.names=row.names(DataExp))
cpi=data.frame(cpi=DataExp[,7], row.names=row.names(DataExp))
dy10=DiffPanel(variable=y10, quantity=rep(35,9))
dopeness=DiffPanel(variable=DataExp[,6], quantity=rep(35,9))
ly10=LagPanel(variable=y10, quantity=rep(35,9))
diip=DiffPanel(variable=DataExp[,11], quantity=rep(35,9))
dcrisk=DiffPanel(variable=DataExp[,9], quantity=rep(35,9))
ldcrisk=LagPanel(variable=dcrisk, quantity=rep(35,9))
dcpi=DiffPanel(variable=DataExp[,7], quantity=rep(35,9))
ddcpi=DiffPanel(variable=dcpi, quantity=rep(35,9))
ldebt=LagPanel(variable=DataExp[,4], quantity=rep(35,9))
# create homogenous preliminary dataset (containing "NA" as a result of DiffPanel, LagPanel)
dataPanel=cbind(y10, dy10, ly10, DataExp[,6], dopeness, diip,
DataExp[,11], ldcrisk, DataExp[,9], ddcpi, DataExp[,7])
dataPanel=data.frame(dataPanel)
names(dataPanel)=c("y10", "dy10", "ly10", "openess", "dopeness", "diip",
"iip", "ldcrisk", "crisk", "ddcpi", "cpi")
dataPanel[1:5,]
# prepare dataset and quantity for PMG or optimPMG functions using PanelNaOmit
dataPanel=PanelNaOmit(dataset=dataPanel, quantity=rep(35,9))
dataPanel$dataset[1:5,]
dataPanel$quantity
# optimPMG
OptimPmgExp=optimPMG(
dLL=10^-10,
maxIter=200,
TetaStart=rep(x=1, times=4), # note that length(TetaStart)=length(vecLR)-1
vecSR=list(SR1=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR2=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR3=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR4=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR5=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR6=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR7=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR8=c("dy10","dopeness","diip","ldcrisk","ddcpi"),
SR9=c("dy10","dopeness","diip","ldcrisk","ddcpi")),
vecLR=c("ly10","openess","iip","crisk","cpi"),
dataset=dataPanel$dataset,
quantity=dataPanel$quantity,
const=TRUE)
OptimPmgExp



