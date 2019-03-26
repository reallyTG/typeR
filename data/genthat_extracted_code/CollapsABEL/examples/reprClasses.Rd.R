library(CollapsABEL)


### Name: reprClasses
### Title: Represent classes of a data.frame in a character vector
### Aliases: reprClasses

### ** Examples

## Not run: 
##D dat = randNormDat(4, 2)
##D x = capture.output(reprClasses(dat), file = NULL)
##D x = eval(parse(text = x))
##D all(x == colClasses(dat))
## End(Not run)




