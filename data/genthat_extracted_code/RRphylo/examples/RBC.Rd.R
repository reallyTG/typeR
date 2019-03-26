library(RRphylo)


### Name: RBC
### Title: Rate By Clade
### Aliases: RBC

### ** Examples

data("DataOrnithodirans")
DataOrnithodirans$treedino->treedino
DataOrnithodirans$massdino->massdino

 ## No test: 

    RRphylo(tree=treedino,y=massdino)->RR

# Case 1. RBC fixing the number of shifts at 2
    RBC(RR=RR,y=massdino,n.shift="fix",NS=2,foldername=tempdir())

# Case 2. RBC automatically searching for shifts
    RBC(RR=RR,y=massdino,n.shift="clust",foldername=tempdir())

    
## End(No test)



