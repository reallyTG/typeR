library(XVector)


### Name: XVector-class
### Title: XVector objects
### Aliases: class:XVector XVector-class XVector length,XVector-method
###   bindROWS,XVector-method subseq subseq<- subseq,XVector-method
###   subseq<-,XVector-method as.numeric,XVector-method show,XVector-method
###   ==,XVector,XVector-method class:XRaw XRaw-class XRaw
###   coerce,raw,XRaw-method coerce,raw,XVector-method
###   coerce,numeric,XRaw-method as.raw,XRaw-method as.integer,XRaw-method
###   as.vector,XRaw-method class:XInteger XInteger-class XInteger
###   coerce,numeric,XInteger-method coerce,integer,XVector-method
###   as.integer,XInteger-method as.vector,XInteger-method class:XDouble
###   XDouble-class XDouble XNumeric coerce,numeric,XDouble-method
###   coerce,numeric,XVector-method as.numeric,XDouble-method
###   as.vector,XDouble-method show,XDouble-method
### Keywords: methods classes

### ** Examples

  ## ---------------------------------------------------------------------
  ## A. XRaw OBJECTS
  ## ---------------------------------------------------------------------

  x1 <- XRaw(4)  # values are not initialized
  x1
  x2 <- as(c(255, 255, 199), "XRaw")
  x2
  y <- c(x1, x2, NULL, x1)  # NULLs are ignored
  y
  subseq(y, start=-4)
  subseq(y, start=-4) <- x2
  y

  ## ---------------------------------------------------------------------
  ## B. XInteger OBJECTS
  ## ---------------------------------------------------------------------

  x3 <- XInteger(12, val=c(-1:10))
  x3
  length(x3)

  ## Subsetting
  x4 <- XInteger(99999, val=sample(99, 99999, replace=TRUE) - 50)
  x4
  subseq(x4, start=10)
  subseq(x4, start=-10)
  subseq(x4, start=-20, end=-10)
  subseq(x4, start=10, width=5)
  subseq(x4, end=10, width=5)
  subseq(x4, end=10, width=0)

  x3[length(x3):1]
  x3[length(x3):1, drop=FALSE]



