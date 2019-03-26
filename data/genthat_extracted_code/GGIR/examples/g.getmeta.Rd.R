library(GGIR)


### Name: g.getmeta
### Title: function to extract meta-data (features) from data in
###   accelerometer file
### Aliases: g.getmeta

### ** Examples

## Not run: 
##D datafile = "C:/myfolder/testfile.bin"
##D 
##D #Extract meta-data:
##D M = g.getmeta(datafile)
##D 
##D #Inspect first couple of rows of long epoch length meta data:
##D print(M$metalong[1:5,])
##D 
##D #Inspect first couple of rows of short epoch length meta data:
##D print(M$metalong[1:5,])
## End(Not run)



