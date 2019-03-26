library(loa)


### Name: 4.8.list.handlers
### Title: List manipulation
### Aliases: 4.8.list.handlers listHandler listUpdate listExpand listLoad
### Keywords: methods

### ** Examples


## Example 1
## general

#  two lists
list1 <- list(a = 1:10, b = FALSE)
list2 <- list(b = TRUE, c = "new")

#  updating a with b
#  keeps unchanged list1 entry, a
#  updates changed list1 entry, b
#  adds new (list2) entry, c
listUpdate(list1, list2)


## Example2
## use in plot functions
## to simplify formals

## Not run: 
##D #  some data
##D a <- 1:10
##D b <- rnorm(10,5,2)
##D 
##D #a bad plot function
##D 
##D badplot <- function(x, ...){
##D 
##D     #setting defaults in xyplot call itself
##D     xyplot(x = x, pch = 20, col = "red",
##D                    panel = function(...){
##D                            panel.grid(-1, -1)
##D                            panel.xyplot(...)
##D                            panel.abline(0,1)
##D                    }, ...)
##D }
##D 
##D   badplot(a~b)                 #OK
##D 
##D #  compare with 
##D   badplot(a~b, xlim = c(1,20)) #OK
##D   badplot(a~b, col = "blue")   #not OK
##D 
##D #  because col hardcoded into badplot function
##D #  It is duplicated in call and '...'
##D #  so user cannot update col 
##D 
##D 
##D #a standard correction
##D 
##D stdplot <- function(x, pch = 20, col = "red", ...){
##D 
##D     #setting defaults in xyplot call itself
##D     xyplot(x = x, pch = 20, col = "red",
##D                    panel = function(x=x, pch=pch, col=col, ...){
##D                            panel.grid(-1, -1)
##D                            panel.xyplot(x=x, pch=pch, col=col, ...)
##D                            panel.abline(0,1)
##D                    }, ...)
##D }
##D 
##D   stdplot(a~b)                  #OK
##D   stdplot(a~b, col = "blue", 
##D           xlim=c(1:20))         #also OK
##D  
##D 
##D #  An alternative correction using lists and 
##D #  listUpdate that removes the need for formal 
##D #  definition of all modified plot arguments 
##D 
##D myplot <- function(x, ...){
##D 
##D     #defaults I set for myplot form of xyplot
##D     mylist <- list(x = x, pch = 20, col = "red",
##D                    panel = function(...){
##D                            panel.grid(-1, -1)
##D                            panel.xyplot(...)
##D                            panel.abline(0,1)
##D                    })
##D     #plot
##D     do.call(xyplot, listUpdate(mylist, list(...)))
##D }
##D 
##D 
##D   myplot(a~b)                 #OK
##D   myplot(a~b, col = "blue", 
##D          xlim = c(1,20))      #also OK
## End(Not run)




