library(spaa)


### Name: turnover
### Title: Calculating species turnover
### Aliases: turnover
### Keywords: turnover

### ** Examples


##example turnover()
plotlab1 <- XYname(4,6)
xxx <- 1:240
dim(xxx) <- c(24, 10)
rownames(xxx) <- plotlab1
### Distance between each pair of plots
ddd <- dist(xxx)
### label matrix
labmat1 <- lab.mat(plotlab1)
yyy <- turnover(labmat1, ddd)




