library(RRphylo)


### Name: setBM
### Title: Producing simulated phenotypes with trends
### Aliases: setBM

### ** Examples

 ## No test: 
data("DataOrnithodirans")
DataOrnithodirans$treedino->treedino

setBM(tree=treedino, nY= 1, type="brown")
setBM(tree=treedino, nY= 1, type="drift", ds=2)
setBM(tree=treedino, nY= 1, type="trend", trend.type="linear", es=2)
## End(No test)



