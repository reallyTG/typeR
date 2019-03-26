library(Tmisc)


### Name: peek
### Title: Peek at the top of a text file
### Aliases: peek

### ** Examples


## Not run: 
##D filename <- tempfile()
##D x<-matrix(round(rnorm(10^4),2),1000,10)
##D colnames(x)=letters[1:10]
##D write.csv(x,file=filename,row.names=FALSE)
##D peek(filename)
## End(Not run)



