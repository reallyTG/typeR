library(rfml)


### Name: $<-,ml.data.frame-method
### Title: Adds a new ml.data.frame field as a ml.col.def-class
### Aliases: $<-,ml.data.frame-method

### ** Examples

## Not run: 
##D  library(rfml)
##D  locConn <- ml.connect()
##D  # create a ml.data.frame based on the iris data set
##D  mlIris <- as.ml.data.frame(locConn, iris, "iris")
##D  # create a field based on an existing
##D  mlIris$newField <- mlIris$Petal.Width
##D  # create a field based calculation on existing
##D  mlIris$newField2 <- mlIris$Petal.Width + mlIris$Petal.Length
##D  # create a field based on an previous created
##D  mlIris$newField3 <- mlIris$Petal.Width + 10
##D  mlIris$abs_width <- abs(mlIris$Petal.Width)
## End(Not run)



