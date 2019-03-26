library(processx)


### Name: process
### Title: External process
### Aliases: process

### ** Examples

# CRAN does not like long-running examples
## Not run: 
##D p <- process$new("sleep", "2")
##D p$is_alive()
##D p
##D p$kill()
##D p$is_alive()
##D 
##D p <- process$new("sleep", "2")
##D p$is_alive()
##D Sys.sleep(3)
##D p$is_alive()
## End(Not run)




