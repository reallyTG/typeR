library(fda)


### Name: knots.fd
### Title: Extract the knots from a function basis or data object
### Aliases: knots.fd knots.fdSmooth knots.basisfd
### Keywords: smooth optimize

### ** Examples

x <- 0:24
y <- c(1.0,1.0,1.4,1.1,1.0,1.0,4.0,9.0,13.0,
       13.4,12.8,13.1,13.0,14.0,13.0,13.5,
       10.0,2.0,3.0,2.5,2.5,2.5,3.0,4.0,3.5)
##
## knots.fdSmooth
##
girlGrowthSm <- with(growth, smooth.basisPar(argvals=age, y=hgtf,
                                             lambda=0.1))
class(girlGrowthSm) # fdSmooth

girlKnots.fdSm  <- knots(girlGrowthSm)
girlKnots.fdSmA <- knots(girlGrowthSm, interior=FALSE)
stopifnot(all.equal(girlKnots.fdSm, girlKnots.fdSmA[5:33]))

##
## knots.df
##
class(girlGrowth.fd <- girlGrowthSm$fd) # fd

girlKnots.fd  <- knots(girlGrowth.fd)
girlKnots.fdA <- knots(girlGrowth.fd, interior=FALSE)

stopifnot(all.equal(girlKnots.fdSm,  girlKnots.fd))
stopifnot(all.equal(girlKnots.fdSmA, girlKnots.fdA))

##
## knots.basisfd
##
class(girlGr.basisfd <- girlGrowth.fd$basis)

girlKnots.basisfd  <- knots(girlGr.basisfd)
girlKnots.basisfdA <- knots(girlGr.basisfd, interior=FALSE)

stopifnot(all.equal(girlKnots.basisfd,  girlKnots.fd))
stopifnot(all.equal(girlKnots.basisfdA, girlKnots.fdA))



