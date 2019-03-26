library(Xmisc)


### Name: xRefClass-class
### Title: Extended Reference Class
### Aliases: xRefClass xRefClass-class

### ** Examples

## Not run: 
##D MyClass <-
##D   setRefClass(
##D     "MyClass",
##D     list(
##D       x="numeric",
##D       y="numeric",
##D       z=function(){x+y}
##D       ),
##D     contains="xRefClass",
##D     methods=list(
##D       initialize=function(...){
##D         .idx <- c(x=1,y=2)
##D         callSuper(...,.index=.idx)
##D       },
##D       printme=function(){
##D         cat('Hello World!','\n')
##D       }
##D       )
##D     )
##D 
##D ## Method initialize - pass by position
##D obj <- MyClass$new(1,2)
##D obj$x
##D obj$y
##D 
##D ## Method initialize - pass by name
##D obj <- MyClass$new(y=2)
##D obj$x
##D obj$y
##D 
##D ## Method copy
##D ## obj <- MyClass$new(1,2)
##D ## obk <- obj$copy()    # Fail!
##D ## ## Error in (function ()  : unused argument (quote("myclass"))
##D 
##D ## Method copy2
##D obj <- MyClass$new(1,2) # No such error!
##D obk <- obj$copy2()
##D obk$z
##D 
##D ## Method update
##D obj <- MyClass$new()
##D obj$printme()
##D MyClass <- # To modify one of the original functions
##D   setRefClass(
##D     "MyClass",
##D     list(
##D       x="numeric",
##D       y="numeric",
##D       z=function(){x+y}
##D       ),
##D     contains="xRefClass",
##D     methods=list(
##D       initialize=function(...){
##D         .idx <- c(x=1,y=2)
##D         callSuper(...,.index=.idx)
##D       },
##D       printme=function(){ # This function is modified
##D         cat('Hello R!','\n')
##D       }
##D       )
##D     )
##D obj$printme() # The function is yet not modified
##D ## Hello World!
##D obj$update("printme") # update the function
##D obj$printme() # The function is modified
##D ## Hello R!
## End(Not run)



