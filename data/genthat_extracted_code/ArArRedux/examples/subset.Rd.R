library(ArArRedux)


### Name: subset.timeresolved
### Title: Select a subset of some data
### Aliases: subset.timeresolved subset.logratios subset.redux
###   subset.results

### ** Examples

data(Melbourne)
ages <- process(Melbourne$X,Melbourne$irr,Melbourne$fract)
MD <- subset(ages,labels=c("MD2-1","MD2-2","MD2-3","MD2-4","MD2-5"))
plotcorr(MD)



