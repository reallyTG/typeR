library(Ecfun)


### Name: nchar0
### Title: Zero characters or NULL
### Aliases: nchar0
### Keywords: manip

### ** Examples

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nchar0(NULL), TRUE)
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nchar0(character(0)), TRUE)
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nchar0(character(3)), TRUE)
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(nchar0(c('a', 'c')), FALSE)
## Don't show: 
)
## End(Don't show)



