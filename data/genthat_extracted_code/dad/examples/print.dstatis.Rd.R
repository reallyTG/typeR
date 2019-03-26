library(dad)


### Name: print.dstatis
### Title: Printing results of STATIS method (interstructure) analysis
### Aliases: print.dstatis

### ** Examples

data(roses)
rosesf <- as.folder(roses[,c("Sha","Den","Sym","rose")])

# Dual STATIS on the covariance matrices
result <- dstatis.inter(rosesf, data.scaled = FALSE, group.name = "rose")
print(result)



