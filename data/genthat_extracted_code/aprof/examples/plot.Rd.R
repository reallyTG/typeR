library(aprof)


### Name: plot.aprof
### Title: plot.aprof
### Aliases: plot.aprof

### ** Examples

## Not run: 
##D # create function to profile
##D foo <- function(N){
##D         preallocate<-numeric(N)
##D         grow<-NULL  
##D          for(i in 1:N){
##D              preallocate[i]<-N/(i+1)
##D              grow<-c(grow,N/(i+1))
##D             }
##D }
##D 
##D ## save function to a source file and reload
##D dump("foo",file="foo.R")
##D source("foo.R")
##D 
##D ## create file to save profiler output
##D tmp<-tempfile()
##D 
##D ## Profile the function
##D Rprof(tmp,line.profiling=TRUE)
##D foo(1e4)
##D Rprof(append=FALSE)
##D 
##D ## Create a aprof object
##D fooaprof<-aprof("foo.R",tmp)
##D plot(fooaprof)
## End(Not run)



