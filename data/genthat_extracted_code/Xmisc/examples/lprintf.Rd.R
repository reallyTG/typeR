library(Xmisc)


### Name: lprintf
### Title: String formatting given an environment
### Aliases: lprintf

### ** Examples

a="fox";b="dog";
x <- 'The quick brown %(a)s jumps over the lazy %(b)s?
Or the quick brown %(b)s jumps over the lazy %(a)s?'

## format given the global environment
lprintf(x)
## [1] "The quick brown fox jumps over the lazy dog?
## Or the quick brown dog jumps over the lazy fox?"

## format given a local environment
myenv <- new.env()
local(
  {a="coyote";b="dog";},
  envir=myenv
)
lprintf(x,myenv)
## [1] "The quick brown coyote jumps over the lazy dog?
## Or the quick brown dog jumps over the lazy coyote?"



