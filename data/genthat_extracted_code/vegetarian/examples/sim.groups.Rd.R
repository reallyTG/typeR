library(vegetarian)


### Name: sim.groups
### Title: Within- and Between-Group Similarities
### Aliases: sim.groups

### ** Examples

data(simesants)
sim.groups(simesants[1:3,],simesants[4:5,],labels=TRUE,boot=TRUE)
sim.groups(simesants[1:3,-1],simesants[4:5,-1])
sim.groups(simesants[1:3,-1],simesants[4:5,-1],labels=TRUE,boot=TRUE)#gives standard errors only
sim.groups(simesants[1:3,-1],simesants[4:5,-1],labels=TRUE,boot=TRUE,boot.arg=list(num.iter=200))#gives standard errors only



