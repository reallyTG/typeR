library(Rmpfr)


### Name: Mnumber-class
### Title: Class "Mnumber" and "mNumber" of "mpfr" and regular numbers and
###   arrays from them
### Aliases: Mnumber-class mNumber-class numericVector-class
### Keywords: classes

### ** Examples

## "Mnumber" encompasses (i.e., "extends") quite a few
##  "vector / array - like" classes:
showClass("Mnumber")
stopifnot(extends("mpfrMatrix", "Mnumber"),
          extends("array",      "Mnumber"))

Mnsub <- names(getClass("Mnumber")@subclasses)
(mNsub <- names(getClass("mNumber")@subclasses))
## mNumber has *one* subclass which is not in Mnumber:
setdiff(mNsub, Mnsub)# namely "numericVector"
## The following are only subclasses of "Mnumber", but not of "mNumber":
setdiff(Mnsub, mNsub)



