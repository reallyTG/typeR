library(ff)


### Name: update.ff
### Title: Update ff content from another object
### Aliases: update.ff update.ffdf
### Keywords: IO data

### ** Examples

  x <- ff(1:100)
  y <- ff(-(1:100))
  message("You should make it a habit to re-assign the return value 
of update although this is not needed currently.")
  x <- update(x, from=y)
  x
  y
  x[] <- 1:100
  x <- update(x, from=y, delete=NA)
  x
  y
  x <- update(x, from=y, delete=TRUE)
  x
  y
  x
  rm(x,y); gc()

  ## Not run: 
##D     message("timings")
##D     x <- ff(1:10000000)
##D     y <- ff(-(1:10000000))
##D     system.time(update(x, from=y))
##D     system.time(update(y, from=x, delete=NA))
##D     system.time(update(x, from=y, delete=TRUE))
##D     rm(x,y); gc()
##D   
## End(Not run)




