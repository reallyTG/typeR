library(STB)


### Name: plot.STB
### Title: Plot Objects of Class 'STB'.
### Aliases: plot.STB

### ** Examples

## Not run: 
##D ### generate an 'STB' object without plotting
##D obj <- stb(rnorm(30), plot=FALSE)
##D plot(obj)
##D 
##D ### manipulate the 'STB' object for plotting
##D obj$legend=TRUE
##D plot(obj)
##D 
##D ### add a previously generated STB-ocject to an existing plot
##D plot(sort(rnorm(30)), sort(rnorm(30)))
##D obj$add <- TRUE
##D plot(obj) 
## End(Not run)



