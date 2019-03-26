library(XVector)


### Name: compact
### Title: Object compaction
### Aliases: xvcopy xvcopy,SharedVector-method xvcopy,XVector-method
###   xvcopy,SharedVector_Pool-method xvcopy,XRawList-method compact
###   compact,ANY-method compact,XVector-method compact,XVectorList-method
### Keywords: methods

### ** Examples

## We illustrate the use of compact() on an XInteger vector (XInteger
## is one of the 3 concrete subclasses of the XVector virtual class):
x <- XInteger(500000, sample(500000))

## subseq() does NOT copy the data stored in an XVector object:
y <- subseq(x, start=41, end=60)
x@shared
y@shared  # same address
object.size(x)
object.size(y)  # same size

## compact() copies the data, but only the data actually "used" by 'y':
y0 <- compact(y)
y0@shared  # new address
object.size(y0)  # much smaller now!

## Compaction is particularly relevant when saving an object with
## external references like 'y':
yfile <- file.path(tempdir(), "y.rda")
save(y, file=yfile)
file.info(yfile)$size

y0file <- file.path(tempdir(), "y0.rda")
save(y0, file=y0file)
file.info(y0file)$size



