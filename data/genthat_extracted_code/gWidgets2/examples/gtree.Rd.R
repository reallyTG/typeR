library(gWidgets2)


### Name: gtree
### Title: constructor for widget to display heirarchical data
### Aliases: .gtree [.GTree gtree svalue.GTree svalue<-.GTree update.GTree

### ** Examples

##################################################
## This tree reads a list
offspring <- function(path=character(0), lst, ...) {
  if(length(path))
    obj <- lst[[path]]
    else
      obj <- lst
  nms <- names(obj)
  hasOffspring <- sapply(nms, function(i) {
    newobj <- obj[[i]]
    is.recursive(newobj) && !is.null(names(newobj))
    })
  data.frame(comps=nms, hasOffspring=hasOffspring, ## fred=nms,
             stringsAsFactors=FALSE)
}
l <- list(a="1", b= list(a="21", b="22", c=list(a="231")))

## Not run: 
##D w <- gwindow("Tree test")
##D t <- gtree(offspring=offspring, offspring.data=l, cont=w)
## End(Not run)

##################################################
## This tree looks at recursive objects
describe <- function(x) UseMethod("describe")
describe.default <- function(x) sprintf("An object with class %s", class(x)[1])
describe.integer <- function(x) sprintf("An integer with %s value%s", length(x),
   ifelse(length(x) > 1, "s", ""))
describe.numeric <- function(x) sprintf("A numeric with %s value%s", length(x),
   ifelse(length(x) > 1, "s", ""))
describe.factor <- function(x) sprint("A factor with %s level%s", length(levels(x)),
   ifelse(length(levels(x)) > 1, "s", ""))

offspring <- function(path, obj) {
  if(length(path) > 0)
    x <- obj[[path]]
  else
    x <- obj

  nms <- names(x)
  recursive <- sapply(x, function(i) {
    is.recursive(i) &&
    !is.null(attr(i, "names")) &&
    length(i) > 0
    })
  descr <- sapply(x, describe)
  
  data.frame(Variable=nms, offspring=recursive, Description=descr, stringsAsFactors=FALSE)
}

l <- lm(mpg ~ wt, mtcars)
## Not run: 
##D w <- gwindow("test")
##D gtree(offspring=offspring, offspring.data=l, cont=w)
## End(Not run)




