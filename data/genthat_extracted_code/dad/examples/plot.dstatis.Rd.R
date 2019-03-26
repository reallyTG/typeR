library(dad)


### Name: plot.dstatis
### Title: Plotting scores of STATIS method (interstructure) analysis
### Aliases: plot.dstatis

### ** Examples

data(roses)
rosesf <- as.folder(roses[,c("Sha","Den","Sym","rose")])

# Dual STATIS on the covariance matrices
result <- dstatis.inter(rosesf, data.scaled = FALSE, group.name = "rose")
plot(result)



