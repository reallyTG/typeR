library(Ecfun)


### Name: Interp
### Title: Interpolate between numbers or numbers of characters
### Aliases: Interp Interp.default InterpChkArgs InterpChar InterpNum
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

# 1.2.  with x but not y:  
# return that vector with a warning
## Don't show: 
InterpChkArgs(1:4, p=.5) # $xout 1:4 OK 
## End(Don't show)
xN1 <- Interp(1:4, p=.5)
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
## Don't show: 
argChk.x.3 <- InterpChkArgs(c('a', 'bc', 'def'), 
        p=0.3)
argC.5 <- list(xout=c('a', 'bc', 'def'))
all.equal(argChk.x.3, argC.5)

argChk.x0.3 <- InterpChkArgs(c('a', 'bc', 'def'), 
        character(0), p=0.3)
all.equal(argChk.x0.3, argC.5)

argChk.3 <- InterpChkArgs(c('a', 'bc', 'def'), 
        character(1), p=0.3)
argC.3 <- list(algorithm="Character", 
      x=c("a", "bc", "def"), y=character(3), 
      proportion=rep(.3, 3), pLength1=TRUE, 
      raw=FALSE, outClass=NULL)
all.equal(argChk.3, argC.3)

argChk.3p <- InterpChkArgs(c('a', 'bc', 'def'), 
        character(1), p=rep(0.3, 3))
argC.3p <- list(algorithm="Character", 
      x=c("a", "bc", "def"), y=character(3), 
      proportion=rep(.3, 3), pLength1=FALSE, 
      raw=FALSE, outClass=NULL)
all.equal(argChk.3p, argC.3p)
## End(Don't show)

i.5 <- Interp(c('a', 'bc', 'def'), character(0), p=0.3)
# with y = NULL or character(0), 
# Interp returns x 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(i.5, c('a', 'bc', 'def'))
## Don't show: 
)
## End(Don't show)

i.5b <- Interp('', c('a', 'bc', 'def'), p=0.3)
# Cumulative characters (length(proportion)=1):  
#     0.3*(total 6 characters) = 1.2 characters
i.5. <- c('a', 'b', '')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(i.5b, i.5.)
## Don't show: 
)
## End(Don't show)

##
## 3.  Reverse character example 
##
i.5c <- Interp(c('a', 'bc', 'def'), '', 0.3)
# check:  0.7*(total 6 characers) = 4.2 characters
i.5c. <- c('a', 'bc', 'd')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(i.5c, i.5c.)
## Don't show: 
)
## End(Don't show)

##
## 4.  More complicated example
##
xCh <- Interp('', c('Do it', 'with R.'), 
              c(0, .5, .9)) 
# answer 
xCh. <- c('', 'with', 'Do i') 
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
xC2 <- Interp(c('a', 'fabulous', 'bug'), 
                  c('bigger or', 'just', 'big'), 
                  c(.3, .3, 1) )
x.y.longer <- c('bigger or', 'fabulous', 'big')
# use y with ties 
# nch smaller        1          4         3
# nch larger         9          8         3
# d.char             8,         4,        0 
# prop              .3,        .7,        1 
# prop*d.char      2.4,       2.8,        0
# smaller+p*d        3,         7,        3
xC2. <- c('big', 'fabulou', 'big')                 
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
null1 <- Interp(NULL, 1, .3)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(null1, 1)
## Don't show: 
)
## End(Don't show)

null2 <- Interp('abc', NULL, .3)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(null2, 'abc')
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
Jan1.1980 <- as.Date('1980-01-01')

Jan1.1972i <- Interp(0, Jan1.1980, .2)
# check 
Jan1.1972 <- as.Date('1972-01-01')

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Jan1.1972, round(Jan1.1972i))
## Don't show: 
)
## End(Don't show)

##
## 9.  POSIXct 
##
Jan1.1980c <- as.POSIXct(Jan1.1980)

Jan1.1972ci <- Interp(0, Jan1.1980c, .2)
# check 
Jan1.1972ct <- as.POSIXct(Jan1.1972)

## Don't show: 
stopifnot(
## End(Don't show)
abs(difftime(Jan1.1972ct, Jan1.1972ci, 
             units="days"))<0.5
## Don't show: 
)
## End(Don't show)



