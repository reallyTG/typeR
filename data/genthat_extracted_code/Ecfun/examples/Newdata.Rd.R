library(Ecfun)


### Name: Newdata
### Title: Create a new data.frame for predict
### Aliases: Newdata
### Keywords: manip

### ** Examples

##
## 1.  A reasonable test with numerics, dates, 
##     an ordered factor and character variables
##
xDate <- as.Date('2001-02-03')+1:4
tstDF <- data.frame(x1=1:4, xDate=xDate, 
  xD2=as.POSIXct(xDate), 
  sex=ordered(c('M', 'F', 'M', 'F')), 
  huh=letters[c(1:3, 3)], stringsAsFactors=FALSE)

newDat <- Newdata(tstDF, 'xDate', n=5)

# check
newD <- data.frame(x1=2.5, 
  xDate=xDate[1]+seq(0, 3, length=5), 
  xD2=as.POSIXct(xDate[2]+0.5), 
  sex=ordered(c('M', 'F', 'M', 'F'))[2], 
  huh=letters[3], stringsAsFactors=FALSE)
attr(newD, 'out.attrs') <- attr(newDat, 'out.attrs')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(newDat, newD)
## Don't show: 
)
## End(Don't show)

##
## 2.  Test with only one column 
##
newDat1 <- Newdata(tstDF[, 2, drop=FALSE], 'xDate', n=5)

# check 
newDat1. <- newD[, 2, drop=FALSE]
attr(newDat1., 'out.attrs') <- attr(newDat1, 'out.attrs')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(newDat1, newDat1.)
## Don't show: 
)
## End(Don't show)

##
## 3.  Test with a factor 
##
newSex <- Newdata(tstDF, 'sex')

# check 
newS <- with(tstDF, data.frame(
  x1=2.5, xDate=xDate[1]+1.5, 
  xD2=as.POSIXct(xDate[1]+1.5), 
  sex=ordered(c('M', 'F'))[2:1], 
  huh=letters[3], stringsAsFactors=FALSE) )
attr(newS, 'out.attrs') <- attr(newSex, 'out.attrs')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(newSex, newS)
## Don't show: 
)
## End(Don't show)

##
## 4.  Test with an integer column number 
##
newDat2 <- Newdata(tstDF, 2, n=5)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(newDat2, newD)
## Don't show: 
)
## End(Don't show)

##
## 5.  Test with all
##
NewAll <- Newdata(tstDF)

# check 
tstLvls <- as.list(tstDF[c(1, 4), ])
tstLvls$sex <- tstDF$sex[2:1]
tstLvls$huh <- letters[c(3, 1)]
tstLvls$stringsAsFactors <- FALSE

NewA. <- do.call(expand.grid, tstLvls)
attr(NewA., 'out.attrs') <- attr(NewAll, 'out.attrs')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(NewAll, NewA.)
## Don't show: 
)
## End(Don't show)



