library(adfExplorer)


### Name: read.adf
### Title: Read an Amiga Disk File
### Aliases: read.adf read.adf,character-method read.adf,ANY-method
###   read.adz read.adz,character-method

### ** Examples

## Not run: 
##D ## In order to read an adf-file, we first need one.
##D ## so let's first write the example obect to a file:
##D data(adf.example)
##D 
##D ## write it to the current working directory:
##D write.adf(adf.example, "test.adf")
##D 
##D ## now we can read it again:
##D my.disk <- read.adf("test.adf")
##D print(my.disk)
##D 
##D ## and this is how you read it,
##D ## using a connection:
##D con <- file("test.adf", "rb")
##D my.disk2 <- read.adf(con)
##D close(con)
##D 
##D print(my.disk2)
##D 
##D ## Alternatively, you can work with ADZ files:
##D write.adz(adf.example, "test.adz")
##D my.disk3 <- read.adz("test.adz")
##D 
##D print(my.disk3)
## End(Not run)



