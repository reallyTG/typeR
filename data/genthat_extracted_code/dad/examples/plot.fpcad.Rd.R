library(dad)


### Name: plot.fpcad
### Title: Plotting scores of principal component analysis of density
###   functions
### Aliases: plot.fpcad

### ** Examples

data(roses)
rosefold <- as.folder(roses[,c("Sha","Den","Sym","rose")])
result <- fpcad(rosefold)
plot(result)



