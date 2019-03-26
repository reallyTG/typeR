library(colourlovers)


### Name: clpatterns
### Title: Retrieve pattern or patterns
### Aliases: clpattern clpatterns print.clpattern print.clpatterns

### ** Examples

e <- function(e) NULL # function for tryCatch to fail in examples

# get a random pattern
tryCatch( clpatterns('random'), error = e)

# plot at a single pattern
p <- tryCatch( clpattern('1451', fmt='json'), error = e)
if(!is.null(p)) plot(p)



