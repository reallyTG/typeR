library(Ecfun)


### Name: getElement2
### Title: Extract a named element from an object with a default
### Aliases: getElement2
### Keywords: manip

### ** Examples

##
## 1.  name in object, return 
##
e1 <- getElement2(list(ab=1), 'ab', 2) # 1
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(e1, 1)
## Don't show: 
)
## End(Don't show)

##
## 2.  name not in object, return default
##
eNA <- getElement2(list(), 'ab') # default default = NA
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(eNA, NA)
## Don't show: 
)
## End(Don't show)

e0 <- getElement2(list(), 'ab', 2) # name not in object
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(e0, 2)
## Don't show: 
)
## End(Don't show)

e2 <- getElement2(list(ab=1), 'a', 2) # partial matching not used 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(e2, 2)
## Don't show: 
)
## End(Don't show)

##
## 3.  name NULL in object, return default 
##
ed <- getElement2(list(a=NULL), 'a',2) # 2 with a warning
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(ed, 2)
## Don't show: 
)
## End(Don't show)

e. <- getElement2(list(a=NULL), 'a', 2, warn.NULL=FALSE) # NULL
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(e., NULL)
## Don't show: 
)
## End(Don't show)

eNULL <- getElement2(list(a=NULL), 'a', NULL) # NULL
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(eNULL, NULL)
## Don't show: 
)
## End(Don't show)

##
## 4.  Language:  find, eval, return 
##
Qte <- quote(plot(1:4, y=x, col=c2))
if(require(pryr)){ 
  Qt <- pryr::standardise_call(Qte) # add the name 'x' 
  fn <- getElement2(Qt)
  eQuote <- getElement2(Qt, 'y')
  Col2 <- getElement2(Qt, 'col', envir=list(c2=2))
# check
## Don't show: 
stopifnot(
## End(Don't show)
  all.equal(fn, 'plot')
## Don't show: 
)
## End(Don't show)
## Don't show: 
stopifnot(
## End(Don't show)
  all.equal(eQuote, 1:4)
## Don't show: 
)
## End(Don't show)
## Don't show: 
stopifnot(
## End(Don't show)
  all.equal(Col2, 2)
## Don't show: 
)
## End(Don't show)
}



