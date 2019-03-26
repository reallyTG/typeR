library(Ecfun)


### Name: createMessage
### Title: Compose a message as a single substring from a character vector
### Aliases: createMessage
### Keywords: manip

### ** Examples

##
## 1.  typical use 
##
tstVec <- c('Now', 'is', 'the', 'time')
msg <- createMessage(tstVec, 9, collapse=':', 
                     endchars='//')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(msg, 'Now:is://')
## Don't show: 
)
## End(Don't show)
##
## 2.  in a function 
##
tstFn <- function(cl)createMessage(deparse(cl), 9)
Cl <- quote(plot(1:3, y=4:6, col='red', main='Title'))
msg0 <- tstFn(Cl)
# check 
msg. <- 'plot(1...'
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(msg0, msg.)
## Don't show: 
)
## End(Don't show)

##
## 3.  default 
##
y <- createMessage(character(3), default='y') 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(y, 'y')
## Don't show: 
)
## End(Don't show)




