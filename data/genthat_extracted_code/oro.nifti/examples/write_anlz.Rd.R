library(oro.nifti)


### Name: writeANALYZE-methods
### Title: writeANALYZE
### Aliases: writeANALYZE-methods writeANALYZE writeANALYZE,anlz-method
### Keywords: file methods

### ** Examples


norm <- dnorm(seq(-5, 5, length=32), sd=2)
norm <- (norm-min(norm)) / max(norm-min(norm))
img <- outer(outer(norm, norm), norm)
img <- round(255*img)
img[17:32,,] <- 255 - img[17:32,,]
img.anlz <- anlz(img) # create Analyze object

writeANALYZE(img.anlz, "test-anlz-image-uint8", verbose=TRUE)
## These files should be viewable in, for example, FSLview
## Make sure you adjust the min/max values for proper visualization
data <- readANALYZE("test-anlz-image-uint8", verbose=TRUE)
image(img.anlz, oma=rep(2,4), bg="white")
image(data, oma=rep(2,4), bg="white")
abs.err <- abs(data - img.anlz)
image(as(abs.err, "anlz"), zlim=range(img.anlz), oma=rep(2,4), bg="white")

## Not run: 
##D ## Loop through all possible data types
##D datatypes <- list(code=c(2, 4, 8, 16, 64),
##D                   name=c("uint8", "int16", "int32", "float", "double"))
##D equal <- vector("list")
##D for (i in 1:length(datatypes$code)) {
##D   fname <- paste("test-anlz-image-", datatypes$name[i], sep="")
##D   rm(img.anlz)
##D   img.anlz <- anlz(img, datatype=datatypes$code[i])
##D   writeANALYZE(img.anlz, fname)
##D   equal[[i]] <- all(readANALYZE(fname) == img)
##D }
##D names(equal) <- datatypes$name
##D unlist(equal)
## End(Not run)



