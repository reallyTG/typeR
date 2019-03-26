library(easySdcTable)


### Name: ProtectTable1
### Title: Easy input interface to sdcTable
### Aliases: ProtectTable1

### ** Examples

## Not run: 
##D z2 <- EasyData("z2")
##D a <- ProtectTable1(z2, c(1, 3, 4), 5)
##D head(as.data.frame(getInfo(a[[1]][[1]], type = "finalData"))  # The table (not two linked))
##D 
##D z3 <- EasyData("z3")
##D b <- ProtectTable1(z3, 1:6, 7)
##D head(as.data.frame(getInfo(b[[1]][[1]], type = "finalData")))  # First table
##D head(as.data.frame(getInfo(b[[2]][[1]], type = "finalData")))  # Second table
## End(Not run)



