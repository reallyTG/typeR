library(gWidgets2)


### Name: gtimer
### Title: Basic timer widget
### Aliases: .gtimer gtimer

### ** Examples

## Not run: 
##D i <- 0
##D FUN <- function(data) {i <<- i + 1; if(i > 10) a$stop_timer(); print(i)}
##D a <- gtimer(1000, FUN)
##D ##
##D ## a one shot timer is run only once
##D FUN <- function(data) message("Okay, I can breathe now")
##D hold_breath <- gtimer(1000*60, FUN, one.shot=TRUE)
## End(Not run)



