library(ttutils)


### Name: plotAndSave
### Title: Display And Save A Plot
### Aliases: plotAndSave

### ** Examples

## Not run: 
##D ## Plotting Function
##D # For 'lattice' graphics:
##D # WRONG:
##D # f <- function(x, ...) xyplot(x~sin(x), ...)
##D # CORRECT:
##D # f <- function(x, ...) print(xyplot(x~sin(x), ...))
##D 
##D f <- function(x, ...) plot(x, sin(x), col=2, type="l", ...)
##D 
##D # Save the plot as "Sine_Function.pdf" in the current folder
##D # and add a title to the plot
##D 
##D plotAndSave(f, "Sine_Function", x=seq(-pi, pi, length=100),
##D             main="Sine-Function", format="pd")
##D 
## End(Not run)


