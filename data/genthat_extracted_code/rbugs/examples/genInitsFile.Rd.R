library(rbugs)


### Name: genInitsFile
### Title: Generating Initial Value Files for BUGS
### Aliases: genInitsFile
### Keywords: utilities

### ** Examples

## when inits is a list:
inits <- list(list(alpha=1, beta=2), list(alpha=4, beta=4))
genInitsFile(2, inits, "foo.init")
file.show("foo.init1.txt")
file.show("foo.init2.txt")
## when inits is a function:
inits <- function() list(alpha=rnorm(2, sd=100),
                         beta=rgamma(1, 0.1, 0.001))
genInitsFile(2, inits, "foo.init")
file.show("foo.init1.txt")
file.show("foo.init2.txt")
unlink("foo.init1.txt")
unlink("foo.init2.txt")



