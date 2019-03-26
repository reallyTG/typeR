library(dad)


### Name: as.data.frame.foldert
### Title: foldert to data frame
### Aliases: as.data.frame.foldert

### ** Examples

data(floribundity)
ftflor <- foldert(floribundity, cols.select = "union", rows.select = "union")
print(ftflor)
dfflor <- as.data.frame(ftflor)
summary(dfflor)



