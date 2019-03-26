library(fame)


### Name: fameIsScalar
### Title: Check for (Fame or Numeric) Scalar or Time Index Series
### Aliases: fameIsScalar
### Keywords: programming math

### ** Examples

fameIsScalar("this is a scalar, since it has length one")
fameIsScalar(c("returns FALSE", "since it has length two"))
fameIsScalar(tis::today())



