library(agridat)


### Name: lee.potatoblight
### Title: Repeated measurements of resistance to potato blight
### Aliases: lee.potatoblight
### Keywords: datasets

### ** Examples


data(lee.potatoblight)
dat <- lee.potatoblight

# Common cultivars across years.
# Based on code from here: http://stackoverflow.com/questions/20709808
gg <- tapply(dat$gen, dat$year, function(x) as.character(unique(x)))
tab <- outer(1:11, 1:11,
             Vectorize(function(a, b) length(Reduce(intersect, gg[c(a, b)]))))
head(tab) # Matches Lee page 27.
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11]
## [1,]   20   10    7    5    3    2    3    2    3     3     2
## [2,]   10   30   17    5    4    3    4    4    5     4     2
## [3,]    7   17   35    9    6    3    4    5    6     4     3
## [4,]    5    5    9   35   16    8    9   14   15    13    11
## [5,]    3    4    6   16   40   12   11   18   18    16    14


# Note the progression to lower scores as time passes in each year
skp <- c(rep(0,10),
         rep(0,7),1,1,1,
         rep(0,8),1,1,
         rep(0,6),1,1,1,1,
         rep(0,5),1,1,1,1,1,
         rep(0,5),1,1,1,1,1,
         rep(0,6),1,1,1,1,
         rep(0,5),1,1,1,1,1,
         rep(0,5),1,1,1,1,1,
         rep(0,5),1,1,1,1,1)

if(require(desplot)){
  desplot(y ~ col*row|date, dat,
          ylab="Year of testing", # unknown aspect
          layout=c(10,11),skip=as.logical(skp),
          main="lee.potatoblight - maps of blight resistance over time")
}


# 1983 only.  I.Hardy succumbs to blight quickly
require("lattice")
xyplot(y ~ date|gen, dat, subset=year==1983, group=rep,
       xlab="Date", ylab="Blight resistance score",
       main="lee.potatoblight 1983", as.table=TRUE,
       auto.key=list(columns=5),
       scales=list(alternating=FALSE, x=list(rot=90, cex=.7)))



