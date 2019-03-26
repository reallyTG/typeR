library(rmatio)


### Name: write.mat
### Title: Write Matlab file
### Aliases: write.mat write.mat,list-method
### Keywords: methods

### ** Examples

## Not run: 
##D filename <- tempfile(fileext = ".mat")
##D 
##D ## Example how to read and write an integer vector with rmatio
##D write.mat(list(a=1:5), filename=filename)
##D a <- as.integer(read.mat(filename)[["a"]])
##D 
##D stopifnot(identical(a, 1:5))
##D 
##D unlink(filename)
##D 
##D ## Read a compressed version 5 MAT file
##D m <- read.mat(system.file("extdata/matio_test_cases_compressed_le.mat",
##D                           package='rmatio'))
##D 
##D ## Write an uncompressed version 5 MAT file
##D write.mat(m, filename="test-uncompressed.mat", compression=FALSE, version="MAT5")
##D 
##D ## Write a compressed version 5 MAT file
##D write.mat(m, filename="test-compressed.mat", compression=TRUE, version="MAT5")
##D 
##D ## Check that the content of the files are identical
##D identical(read.mat("test-uncompressed.mat"), read.mat("test-compressed.mat"))
##D 
##D unlink("test-uncompressed.mat")
##D unlink("test-compressed.mat")
##D 
##D ## Example how to read and write a S4 class with rmatio
##D ## Create 'DemoS4Mat' class
##D setClass("DemoS4Mat",
##D          representation(a = "dgCMatrix",
##D                         b = "integer",
##D                         c = "matrix",
##D                         d = "numeric"))
##D 
##D ## Create a function to coerce a 'DemoS4Mat' object to a list.
##D setAs(from="DemoS4Mat",
##D       to="list",
##D       def=function(from)
##D       {
##D         return(list(a=from@a,
##D                     b=from@b,
##D                     c=from@c,
##D                     d=from@d))
##D       }
##D )
##D 
##D ## Create a function to coerce a list to a 'DemoS4Mat' object.
##D setAs(from="list",
##D       to="DemoS4Mat",
##D       def=function(from)
##D       {
##D         return(new("DemoS4Mat",
##D                     a=from[["a"]],
##D                     b=as.integer(from[["b"]]),
##D                     c=from[["c"]],
##D                     d=from[["d"]]))
##D       }
##D )
##D 
##D ## Define a method to write a 'DemoS4Mat' object to a MAT file.
##D setMethod("write.mat",
##D           signature(object = "DemoS4Mat"),
##D           function(object,
##D                    filename,
##D                    compression,
##D                    version)
##D           {
##D             ## Coerce the 'DemoS4Mat' object to a list and
##D             ## call 'rmatio' 'write.mat' with the list.
##D             return(write.mat(as(object, "list"),
##D                              filename,
##D                              compression,
##D                              version))
##D           }
##D )
##D 
##D ## Create a new 'DemoS4Mat' object
##D demoS4mat <- new("DemoS4Mat",
##D                  a = Matrix(c(0, 0, 0, 0, 0, 0, 1, 0, 0,
##D                               0, 0, 0, 0, 0, 0, 0, 1, 0,
##D                               0, 0, 0, 0, 0, 0, 0, 0, 1),
##D                               nrow=3,
##D                               ncol=9,
##D                               byrow=TRUE,
##D                               sparse=TRUE),
##D                  b = 1:5,
##D                  c = matrix(as.numeric(1:9), nrow=3),
##D                  d = c(6.0, 7.0, 8.0))
##D 
##D ## Write to MAT file
##D write.mat(demoS4mat, filename)
##D 
##D ## Read the MAT file
##D demoS4mat.2 <- as(read.mat(filename), "DemoS4Mat")
##D 
##D ## Check result
##D stopifnot(identical(demoS4mat, demoS4mat.2))
##D 
##D unlink(filename)
## End(Not run)



