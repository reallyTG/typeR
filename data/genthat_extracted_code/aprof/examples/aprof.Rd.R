library(aprof)


### Name: aprof
### Title: Create an 'aprof' object for usage in the package 'aprof'
### Aliases: aprof

### ** Examples

## Not run: 
##D    ## create function to profile
##D      foo <- function(N){
##D              preallocate<-numeric(N)
##D              grow<-NULL
##D               for(i in 1:N){
##D                   preallocate[i]<-N/(i+1)
##D                   grow<-c(grow,N/(i+1))
##D                  }
##D      }
##D 
##D      ## save function to a source file and reload
##D      dump("foo",file="foo.R")
##D      source("foo.R")
##D 
##D      ## create file to save profiler output
##D      tmp<-tempfile()
##D 
##D      ## Profile the function
##D      Rprof(tmp,line.profiling=TRUE)
##D      foo(1e4)
##D      Rprof(append=FALSE)
##D 
##D      ## Create a aprof object
##D      fooaprof<-aprof("foo.R",tmp)
##D      ## display basic information, summarize and plot the object
##D      fooaprof
##D      summary(fooaprof)
##D      plot(fooaprof)
##D      profileplot(fooaprof)
##D 
##D      ## To continue with memory profiling:
##D      ## enable memory.profiling=TRUE
##D      Rprof(tmp,line.profiling=TRUE,memory.profiling=TRUE)
##D      foo(1e4)
##D      Rprof(append=FALSE)
##D      ## Create a aprof object
##D      fooaprof<-aprof("foo.R",tmp)
##D      ## display basic information, and plot memory usage
##D      fooaprof
##D      
##D      plot(fooaprof)
##D    
## End(Not run)



