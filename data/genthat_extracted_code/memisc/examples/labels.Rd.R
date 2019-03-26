library(memisc)


### Name: labels
### Title: Value Labels
### Aliases: labels labels,item-method labels<- labels<-,item,ANY-method
###   labels<-,item,NULL-method labels<-,vector,ANY-method
###   value.labels-class initialize,value.labels-method
###   Arith,value.labels,ANY-method
###   [,value.labels,numeric,missing,missing-method
###   [,value.labels,logical,missing,missing-method
###   coerce,numeric,value.labels-method
###   coerce,character,value.labels-method
###   coerce,value.labels,numeric-method
###   coerce,value.labels,character-method as.vector,value.labels-method
###   show,value.labels-method

### ** Examples

  x <- as.item(rep(1:5,4),
      labels=c(
          "First"      = 1,
          "Second"     = 2,
          "Third"      = 3,
          "Fourth"     = 4,
          "Don't know" = 5
        ),
      missing.values=5,
      annotation = c(
        description="test"
      ))
  labels(x)
  labels(x) <- labels(x) - c("Second"=2)
  labels(x)
  labels(x) <- labels(x) + c("Second"=2)
  labels(x)

  puvl <- getOption("print.use.value.labels")
  options(print.use.value.labels=FALSE)
  x
  options(print.use.value.labels=TRUE)
  x
  options(print.use.value.labels=puvl)



