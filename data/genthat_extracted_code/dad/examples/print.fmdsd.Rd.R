library(dad)


### Name: print.fmdsd
### Title: Printing results of a multidimensional scaling analysis of
###   probability densities
### Aliases: print.fmdsd

### ** Examples

data(roses)
x <- roses[,c("Sha","Den","Sym","rose")]
rosesfold <- as.folder(x)
result <- fmdsd(rosesfold)
print(result)
print(result, mean.print = TRUE)



