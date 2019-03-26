library(EcoGenetics)


### Name: eco.slide.con
### Title: Sliding a window along a connection network
### Aliases: eco.slide.con

### ** Examples


## Not run: 
##D 
##D data(eco2)
##D myMatrix <- eco2[["P"]]
##D con <- eco.weight(XY = eco2[["XY"]], method = "knearest", k = 5)
##D result <- eco.slide.con(myMatrix, con, function(x) mean(x, na.rm = TRUE))
##D 
##D image(matrix(myMatrix[, 1], 30, 30)) # original image
##D image(matrix(result[, 1], 30, 30)) # smoothed image
##D 
##D data(eco3)
##D myMatrix2 <- eco3[["P"]]
##D con <- eco.weight(XY = eco3[["XY"]], method="knearest", k = 5)
##D eco.plotWeight(con)
##D # smoothing values in myMatrix2 using the connection network:
##D result <- eco.slide.con(myMatrix2, con, function(x) mean(x, na.rm = TRUE))
##D 
## End(Not run)




