library(dad)


### Name: print.fpcad
### Title: Printing results of a functional PCA of probability densities
### Aliases: print.fpcad

### ** Examples

data(roses)
rosefold <- as.folder(roses[,c("Sha","Den","Sym","rose")])
result <- fpcad(rosefold)
print(result)
print(result, mean.print = TRUE)



