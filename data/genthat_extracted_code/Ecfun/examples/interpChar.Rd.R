library(Ecfun)


### Name: interpChar
### Title: Interpolate between numbers or numbers of characters
### Aliases: interpChar interpChar.list interpChar.default
### Keywords: manip

### ** Examples

##
## 1.  numerics 
## 
# 1.1.  standard 
xNum <- interpChar(1:3, 4:5, (0:3)/4)
# answer 
xN. <- c(1, 2.75, 3.5, 4)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xNum, xN.)
## Don't show: 
)
## End(Don't show)

# 1.2.  list of length 1 with a numeric vector: 
#       return that vector with a warning
xN1 <- interpChar(list(a.0=1:4), .5)
# answer 
xN1. <- 1:4
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xN1, xN1.)
## Don't show: 
)
## End(Don't show)

##
## 2.  Single character vector 
##
i.5 <- interpChar(list(c('a', 'bc', 'def')), .p=0.3)
# If cumulative characters:  
#        0.3*(total 6 characters) = 1.8 characters
#
# However, the current code does something different, 
# returning "a", "bc", "d" <- like using 1-.p?  
# This is a problem with the defaults with a single 
# argument;  ignore this issue for now.  
# 2014-06-04
i.5. <- c('a', 'b', '')
#all.equal(i.5, i.5.)

##
## 3.  Reverse character example 
##
i.5c <- interpChar(c('a', 'bc', 'def'), '', 0.3)
# check:  0.7*(total 6 characers) = 4.2 characters
i.5c. <- c('a', 'bc', 'd')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(i.5c, i.5c.)
## Don't show: 
)
## End(Don't show)

#  The same thing specified in a list 
i.5d <- interpChar(list(c('a', 'bc', 'def'), ''), 0.3)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(i.5d, i.5c.)
## Don't show: 
)
## End(Don't show)

##
## 4.  More complicated example
##
xCh <- interpChar(list(c('Do it', 'with R.')), 
                  c(0, .5, .9)) 
# answer 
xCh. <- c('', 'with', 'Do ') 
# With only one input, it's assumed to be y.  
# It is replicated to length(.proportion), 
# With nchar = 5, 7, 5, cum = 5, 12, 17.  
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xCh, xCh.)
## Don't show: 
)
## End(Don't show)
##
## 5.  Still more complicated 
##
xC2 <- interpChar(c('a', 'fabulous', 'bug'), 
                  c('bigger or', 'just', 'big'), 
                  c(.3, .3, 1) )
# answer 
x.y.longer <- c('bigger or', 'fabulous', 'big')
# use y with ties 
# nch smaller        1          4         3
# nch larger         9          8         3
# d.char             8,         4,        0 
# cum characters     8,        12,       12 
# prop              .3,        .7,        1 
# prop*12          3.6,       8.4,       12
# cum.sm             1,         5,        8
# cum.sm+prop*12     5,        13,       20
#   -cum(larger[-1]) 5,         4,        3
xC2. <- c('bigge', 'fabu', 'big')                 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xC2, xC2.)
## Don't show: 
)
## End(Don't show)

##
## 6.  with one NULL 
##
null1 <- interpChar(NULL, 1, 1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(null1, 1)
## Don't show: 
)
## End(Don't show)

null2 <- interpChar('abc', NULL, .3)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(null2, 'ab')
## Don't show: 
)
## End(Don't show)
##
## 7.  length=0 
##
log0 <- interpChar(logical(0), 2, .6)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(log0, 1.2)
## Don't show: 
)
## End(Don't show)

##
## 8.  Date
##



##
## 9.  POSIXct 
##




