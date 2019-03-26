library(rfml)


### Name: [,ml.data.frame-method
### Title: Extract subsets of a ml.data.frame
### Aliases: [,ml.data.frame-method

### ** Examples

## Not run: 
##D  library(rfml)
##D  localConn <- ml.connect()
##D  # create a ml.data.frame based on the iris data set
##D  mlIris <- as.ml.data.frame(localConn, iris, "iris")
##D  # select first three columns
##D  mlIris2 <- mlIris[1:3]
##D  # same
##D  mlIris2 <- mlIris[,1:3]
##D  # same
##D  mlIris2 <- mlIris[,c("Sepal.Length","Sepal.Width","Petal.Length")]
##D  # select first three columns for all rows with Spieces = setosa
##D  mlIris2 <- mlIris[mlIris$Species=="setosa", 1:3]
##D  # select all columns for all rows with Spieces = setosa
##D  mlIris2 <- mlIris[mlIris$Species=="setosa",]
##D  # select all columns for all rows with "setosa" in any column
##D  mlIris2 <- mlIris["setosa",]
## End(Not run)



