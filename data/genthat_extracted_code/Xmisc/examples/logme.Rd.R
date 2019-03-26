library(Xmisc)


### Name: logme
### Title: Log the name and the content of an R object
### Aliases: logme

### ** Examples

## log an object
x1 <- 1:6
logme(x1)

## log according to logger levels
bar <- function(x,envir=sys.frame(sys.parent(0))){
  for (.logger in get_loglevel()) {
    if (is.null(.logger)) .prefix <- 'NULL' else .prefix <- .logger
    logme(x,prefix=.prefix,logger=.logger,envir=envir)
  }
}
options(logger='DEBUG')
bar(1:6) # print logs of level NULL, INFO and DEBUG
options(logger='ERROR')
bar(1:6) # print logs of level NULL, INFO, DEBUG, WARNING and ERROR



