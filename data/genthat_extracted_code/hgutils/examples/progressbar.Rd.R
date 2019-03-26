library(hgutils)


### Name: progressbar
### Title: Creates an animated progress bar
### Aliases: progressbar render render.fraction_progressbar
###   render.iteration_progressbar render.progressbar

### ** Examples

## Not run: 
##D # simple progressbar
##D bar = progressbar(format = "[[|][|/-\\][ ]]")
##D # fancy progressbar using UTF-8 codes
##D n_operations = 1000
##D bar2 = progressbar(format="\u25ba[\u2589][\u2580\u2584][\u3000]\u25c4", n_iterations=n_operations)
##D 
##D for(i in 1:n_operations) {
##D   cat("\r", render(bar),sep="")
##D   Sys.sleep(0.01)
##D }
## End(Not run)



