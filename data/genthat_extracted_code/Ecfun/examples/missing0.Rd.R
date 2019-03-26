library(Ecfun)


### Name: missing0
### Title: Missing or length 0
### Aliases: missing0
### Keywords: manip

### ** Examples

tstFn <- function(x)missing0(x)
# missing 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tstFn(), TRUE)
## Don't show: 
)
## End(Don't show)

# length 0 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tstFn(logical()), TRUE)
## Don't show: 
)
## End(Don't show)

# supplied 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tstFn(1), FALSE)
## Don't show: 
)
## End(Don't show)




