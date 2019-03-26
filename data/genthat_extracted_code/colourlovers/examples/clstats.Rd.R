library(colourlovers)


### Name: clstats
### Title: Retrieve basic statistics from COLOURlovers.
### Aliases: clstats print.clstats

### ** Examples

e <- function(e) NULL # function for tryCatch to fail in examples

tryCatch( clstats('colors'), error = e)
tryCatch( clstats('palettes'), error = e)
tryCatch( clstats('patterns'), error = e)
tryCatch( clstats('lovers'), error = e)



