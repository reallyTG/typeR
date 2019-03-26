library(dad)


### Name: interpret.dstatis
### Title: Scores of the 'dstatis' function vs. moments of the densities
### Aliases: interpret.dstatis

### ** Examples

data(roses)
rosesf <- as.folder(roses[,c("Sha","Den","Sym","rose")])

# Dual STATIS on the covariance matrices
result <- dstatis.inter(rosesf, group.name = "rose")
interpret(result)
interpret(result, moment = "var")
interpret(result, moment = "cor")
interpret(result, nscore = 1:2)



