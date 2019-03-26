library(freqweights)


### Name: make.readchunk
### Title: Fast and friendly chunk file finagler
### Aliases: make.readchunk
### Keywords: IO manip

### ** Examples


## Not run: 
##D library(hflights)
##D nrow(hflights) # Number of rows
##D 
##D ## We create a file with no header
##D input <- "hflights.csv"
##D write.table(hflights,file=input,sep=",",
##D             row.names=FALSE,col.names=FALSE)
##D 
##D ## Get the number of rows of each chunk
##D readchunk <- make.readchunk(input,FUN=function(x){NROW(x)})
##D 
##D a <- NULL
##D while(!is.null(b <- readchunk())) {
##D   if(is.null(a)) {
##D     a <- b
##D   } else {
##D     a <- a+b
##D   }
##D }
##D all.equal(a, nrow(hflights))
##D 
##D ## It resets automatically the file 
##D a <- NULL 
##D while(!is.null(b <- readchunk())) {
##D   if(is.null(a)) {
##D     a <- b
##D   } else {
##D     a <- a+b
##D   }
##D }
##D all.equal(a, nrow(hflights))
## End(Not run)



