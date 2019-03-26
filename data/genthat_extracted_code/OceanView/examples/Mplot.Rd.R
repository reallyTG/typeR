library(OceanView)


### Name: Matrix plotting
### Title: Functions for plotting matrices, or for splitting them and for
###   maing suitable summaries
### Aliases: Mplot Msplit Mcommon Msummary Mdescribe
### Keywords: hplot

### ** Examples

# save plotting parameters
 pm <- par("mfrow")

## =======================================================================
## Create three dummy matrices
## =======================================================================

 M1 <- matrix(nrow = 10, ncol = 5, data = 1:50)
 colnames(M1) <- LETTERS[1:5]

 M2 <- M1[, c(1, 3, 4, 5, 2)] 
 M2[ ,-1] <- M2[,-1] /2
 colnames(M2)[3] <- "CC"  # Different name

 M3 <- matrix(nrow = 5, ncol = 4, data = runif(20)*10) 
 M3[,1] <- sort(M3[,1])
 colnames(M3) <- colnames(M1)[-3]

# show them
 head(M1); head(M2); head(M3)
 Msummary(M1)
 Msummary(M1, M2, M3)

# plot all columns of M3 -  will change mfrow 
 Mplot(M3, type = "b", pch = 18, col = "red")

# plot results of all three data sets
 Mplot(M1, M2, M3, lwd = 2, mtext = "All variables versus 1st column",
       legend = list(x = "top", legend = c("M1", "M2", "M3")))


## =======================================================================
## Plot a selection or only common elements
## =======================================================================

 Mplot(M1, M2, M3, x = "B", select = c("A", "E"), pch = c(NA, 16, 1), 
       type = c("l", "p", "b"), col = c("black", "red", "blue"),  
       legend = list(x = "right", legend = c("M1", "M2", "M3")))

 Mplot(Mcommon(M1, M2, M3), lwd = 2, mtext = "common variables", 
       legend = list(x = "top", legend = c("M1", "M2", "M3")))

 Mdescribe(Mcommon(M1, M2, M3))
 
## =======================================================================
## The iris and Orange data set
## =======================================================================

# Split the matrix according to the species
 Irislist <- Msplit(iris, split = "Species")
 names(Irislist)
 
 Mdescribe(Irislist, which = "Sepal.Length")
 Mdescribe(iris, which = "Sepal.Length", subset = Species == "setosa")

# legend in a separate plot
 Mplot(Irislist, type = "p", pos.legend = 0,
       legend = list(x = "center", title = "species"))

 Mplot(Msplit(Orange,1), lwd = 2,
       legend = list(x = "topleft", title = "tree nr"))
 Msummary(Msplit(Orange,1))

# reset plotting parameters
 par(mfrow = pm)



