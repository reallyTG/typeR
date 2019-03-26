library(formatR)


### Name: usage
### Title: Show the usage of a function
### Aliases: usage

### ** Examples

library(formatR)
usage(var)

usage(plot)

usage(plot.default)  # default method
usage("plot.lm")  # on the 'lm' class

usage(usage)

usage(barplot.default, width = 60)  # output lines have 60 characters or less

# indent by width of 'barplot('
usage(barplot.default, width = 60, indent.by.FUN = TRUE)

## Not run: 
##D # a warning is raised because the width constraint is unfulfillable
##D usage(barplot.default, width = 30)
## End(Not run)



