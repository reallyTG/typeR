library(dad)


### Name: plot.fmdsd
### Title: Plotting scores of multidimensional scaling of density functions
### Aliases: plot.fmdsd

### ** Examples

data(roses)
x <- roses[,c("Sha","Den","Sym","rose")]
rosesfold <- as.folder(x)
result <- fmdsd(rosesfold)
plot(result)



