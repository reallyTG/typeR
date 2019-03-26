library(vegetarian)


### Name: sim.table
### Title: Similarity Summary Table
### Aliases: sim.table

### ** Examples

data(simesants)
sim.table(simesants[,-1])
sim.table(simesants,labels=TRUE)
sim.table(simesants,labels=TRUE, diag=FALSE)
sim.table(simesants,labels=TRUE, half=FALSE)
sim.table(simesants,labels=TRUE,boot=TRUE)#standard errors only
sim.table(simesants,labels=TRUE,boot=TRUE, boot.arg=list(num.iter=200), q=2)#standard errors only




