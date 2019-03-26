library(oro.nifti)


### Name: writeNIfTI-methods
### Title: writeNIfTI
### Aliases: writeNIfTI-methods writeNIfTI writeNIfTI,nifti-method
###   writeNIfTI,anlz-method writeNIfTI,array-method
###   writeNIfTI,niftiExtension-method
### Keywords: file methods

### ** Examples


norm <- dnorm(seq(-5, 5, length=32), sd=2)
norm <- (norm-min(norm)) / max(norm-min(norm))
img <- outer(outer(norm, norm), norm)
img <- round(255 * img)
img[17:32,,] <- 255 - img[17:32,,]
img.nifti <- nifti(img) # create NIfTI object

writeNIfTI(img.nifti, "test-nifti-image-uint8", verbose=TRUE)
## These files should be viewable in, for example, FSLview
## Make sure you adjust the min/max values for proper visualization
data <- readNIfTI("test-nifti-image-uint8", verbose=TRUE)
image(img.nifti, oma=rep(2,4), bg="white")
image(data, oma=rep(2,4), bg="white")
abs.err <- abs(data - img.nifti)
image(as(abs.err, "nifti"), zlim=range(img.nifti), oma=rep(2,4),
      bg="white")

## Not run: 
##D ## Loop through all possible data types
##D datatypes <- list(code=c(2, 4, 8, 16, 64),
##D                   name=c("uint8", "int16", "int32", "float", "double"))
##D equal <- vector("list")
##D for (i in 1:length(datatypes$code)) {
##D   fname <- paste("test-nifti-image-", datatypes$name[i], sep="")
##D   rm(img.nifti)
##D   img.nifti <- nifti(img, datatype=datatypes$code[i])
##D   writeNIfTI(img.nifti, fname, verbose=TRUE)
##D   equal[[i]] <- all(readNIfTI(fname) == img)
##D }
##D names(equal) <- datatypes$name
##D unlist(equal)
## End(Not run)



