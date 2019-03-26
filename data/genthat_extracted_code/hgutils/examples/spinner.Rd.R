library(hgutils)


### Name: spinner
### Title: Creates an animated spinner
### Aliases: spinner render.spinner

### ** Examples

## Not run: 
##D sp = spinner("|/-\\")
##D n_operations = 100
##D 
##D for(i in 1:n_operations) {
##D   cat("\r", render(sp),sep="")
##D   Sys.sleep(0.01)
##D }
## End(Not run)



