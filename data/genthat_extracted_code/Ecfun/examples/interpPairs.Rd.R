library(Ecfun)


### Name: interpPairs
### Title: interpolate between pairs of vectors in a list
### Aliases: interpPairs interpPairs.call interpPairs.function
###   interpPairs.list
### Keywords: manip

### ** Examples

###
###
### 1.  interpPairs.function
###
###

##
## 1.1.  simple 
##
plot0 <- quote(plot(0))
plot0. <- interpPairs(plot0)
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(plot0, plot0.)
## Don't show: 
)
## End(Don't show)

##
## 1.2.  no op 
##
noop <- interpPairs(plot0, iFrame=-1)
# check
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(noop, enquote(NULL))
## Don't show: 
)
## End(Don't show)

##
## 1.3.  a more typical example
## example function for interpPairs 
tstPlot <- function(){
  plot(1:2, 1:2, type='n')
  lines(firstFrame=1:3, 
        lastFrame=4, 
        x.1=seq(1, 2, .5), 
        y.1=x, 
        z.0=0, z.1=1, 
        txt.1=c('CRAN is', 'good', '...'), 
        col='red')
}
tstbo <- body(tstPlot)
iPlot <- interpPairs(tstbo[[2]])
# check 
iP <- quote(plot(1:2, 1:2, type='n'))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(iPlot, iP)
## Don't show: 
)
## End(Don't show)

iLines <- interpPairs(tstbo[[3]], nFrames=5, iFrame=2)
# check:  
# .proportion = (iFrame-firstFrame)/(lastFrame-firstFrame)
#  = c(1/3, 0, -1/3)
# if x.0 = 0 and y.0 = 0 by default:  
iL <- quote(linex(x=c(1/3, 0), y=c(1/9, 0), z=c(1/3, 0), 
           tst=c('CR', '')))
##
##**** This example seems to give the wrong answer
##**** 2014-06-03:  Ignore for the moment 
##           
#all.equal(iLines, iL)

##
## 1.4.  Don't throw a cryptic error with NULL 
##
ip0 <- interpPairs(quote(text(labels.1=NULL)))
  
  
###
###
### 2.  interpPairs.list
###
###

##
## 2.1.  (x.0, y.0, x.1, y.1) -> (x,y)
##
tstList <- list(x.0=1:5, y.0=5:9, y.1=9:5, x.1=9,
                ignore=letters, col=1:5)
xy <- interpPairs(tstList, 0.1)
# check 
xy. <- list(ignore=letters, col=1:5, 
            x=1:5 + 0.1*(9-1:5), 
            y=5:9 + 0.1*(9:5-5:9) )
# New columns, 'x' and 'y', come after 
# columns 'col' and 'ignore' already in tstList 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xy, xy.)
## Don't show: 
)
## End(Don't show)

##
## 2.2.  Select the middle 2:  
##      x=(1-(0,1))*3:4+0:1*0=(3,0)
##
xy0 <- interpPairs(tstList[-4], c(-Inf, -1, 0, 1, 2) )
# check 
xy0. <- list(ignore=letters, col=3:4, x=c(3,0), y=7:6)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xy0, xy0.)
## Don't show: 
)
## End(Don't show)
##
## 2.3.  Null interpolation because of absence of y.1 and x.0  
##
xy02 <- interpPairs(tstList[c(2, 4)], 0.1)
# check 
#### NOT the current default answer;  revisit later.  
xy02. <- list(y=5:9, x=9)

# NOTE:  length(x) = 1 = length(x.1) in testList
#all.equal(xy02, xy02.)

##
## 2.4.  Select an empty list (make sure this works)
##
x0 <- interpPairs(list(), 0:1)
# check 
x0. <- list()
names(x0.) <- character(0)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(x0, x0.)
## Don't show: 
)
## End(Don't show)

##
## 2.5.  subset one vector only 
##
xyz <- interpPairs(list(x=1:4), c(-1, 0, 1, 2))
# check 
xyz. <- list(x=2:3)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xyz, xyz.)
## Don't show: 
)
## End(Don't show)

##
## 2.6.  with elements of class call
##
xc <- interpPairs(list(x=1:3, y=quote(x+sin(pi*x/6))), 0:1)
# check
xc. <- list(x=1:3, y=quote(x+sin(pi*x/6)))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(xc, xc.)
## Don't show: 
)
## End(Don't show)

##
## 2.7. text
##
#  2 arguments 
j.5 <- interpPairs(list(x.0='', x.1=c('a', 'bc', 'def')), 0.5)
# check  
j.5. <- list(x=c('a', 'bc', ''))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(j.5, j.5.)
## Don't show: 
)
## End(Don't show)

##
##  2.8.  text, 1 argument as a list 
##
j.50 <- interpPairs(list(x.1=c('a', 'bc', 'def')), 0.5)
# check  
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(j.50, j.5.)
## Don't show: 
)
## End(Don't show)

##
## 2.9.  A more complicated example with elements to eval
##
logo.jpg <- paste(R.home(), "doc", "html", "logo.jpg",
                  sep = .Platform$file.sep)
if(require(jpeg)){
  Rlogo <- readJPEG(logo.jpg)
# argument list for a call to rasterImage or rasterImageAdj   
  RlogoLoc <- list(image=Rlogo,
    xleft.0 = c(NZ=176.5,CH=172,US=171,  CN=177,RU= 9.5,UK= 8),
    xleft.1 = c(NZ=176.5,CH=  9,US=-73.5,CN=125,RU= 37, UK= 2),
    ybottom.0=c(NZ=-37,  CH=-34,US=-34,  CN=-33,RU= 48, UK=47),
    ybottom.1=c(NZ=-37,  CH= 47,US= 46,  CN= 32,RU=55.6,UK=55),
    xright=quote(xleft+xinch(0.6)),
    ytop = quote(ybottom+yinch(0.6)),
    angle.0 =0,
    angle.1 =c(NZ=0,CH=3*360,US=5*360, CN=2*360,RU=360,UK=360)
    )

  RlogoInterp <- interpPairs(RlogoLoc, 
            .proportion=rep(c(0, -1), c(2, 4)) )
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(names(RlogoInterp), 
   c('image', 'xright', 'ytop', 'xleft', 'ybottom', 'angle'))
## Don't show: 
)
## End(Don't show) 
# NOTE:  'xleft', and 'ybottom' were created in interpPairs, 
# and therefore come after 'xright' and 'ytop', which were 
# already there.  

##
## 2.10.  using envir
##
  RlogoDiag <- list(x0=quote(Rlogo.$xleft), 
                  y0=quote(Rlogo.$ybottom), 
                  x1=quote(Rlogo.$xright), 
                  y1=quote(Rlogo.$ytop) ) 

  RlogoD <- interpPairs(RlogoDiag, .p=1, 
                      envir=list(Rlogo.=RlogoInterp) ) 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(RlogoD, RlogoDiag)
## Don't show: 
)
## End(Don't show)
}
##
## 2.11.  assign;  no interp but should work   
##
tstAsgn <- as.list(quote(op <- (1:3)^2))
intAsgn <- interpPairs(tstAsgn, 1)

# check 
intA. <- tstAsgn 
names(intA.) <- c('X', 'X.3', 'X.2')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(intAsgn, intA.)
## Don't show: 
)
## End(Don't show)

#   op <- par(...)
tstP <- quote(op <- par(mar=c(5, 4, 2, 2)+0.1))
tstPar <- as.list(tstP)
intPar <- interpPairs(tstPar, 1)

# check 
intP. <- list(quote(`<-`), quote(op), 
              quote(par(mar=c(5, 4, 2, 2)+0.1)) )
names(intP.) <- c("X", 'X.3', 'X.2')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(intPar, intP.)
## Don't show: 
)
## End(Don't show)

intP. <- interpPairs(tstP)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(intP., tstP)
## Don't show: 
)
## End(Don't show)

##
## NULL 
## 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(interpPairs(NULL), quote(NULL)) 
## Don't show: 
)
## End(Don't show)



