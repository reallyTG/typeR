library(magic)


### Name: is.magichypercube
### Title: magic hypercubes
### Aliases: is.semimagichypercube is.magichypercube is.nasik
###   is.alicehypercube is.perfect is.diagonally.correct is.latinhypercube
### Keywords: array

### ** Examples

library(abind)
is.semimagichypercube(magiccube.2np1(1))
is.semimagichypercube(magichypercube.4n(1,d=4))

is.perfect(magichypercube.4n(1,d=4))

# Now try an array with minmax(dim(a))==FALSE:
a <- abind(magiccube.2np1(1),magiccube.2np1(1),along=2)
is.semimagichypercube(a,g=TRUE)$rook.sums

# is.semimagichypercube() takes further arguments:
mymax <- function(x,UP){max(c(x,UP))}
not_mag  <- array(1:81,rep(3,4))
is.semimagichypercube(not_mag,func=mymax,UP=80)  # FALSE
is.semimagichypercube(not_mag,func=mymax,UP=81)  # TRUE


a2 <- magichypercube.4n(m=1,d=4)
is.diagonally.correct(a2)
is.diagonally.correct(a2,g=TRUE)$diag.sums

## To extract corner elements (note func(1:n) != func(n:1)):
is.diagonally.correct(a2,func=function(x){x[1]},g=TRUE)$diag.sums 


#Now for a subhypercube of a magic hypercube that is not semimagic:
is.magic(allsubhypercubes(magiccube.2np1(1))[[10]])

data(hendricks)
is.perfect(hendricks)


#note that Hendricks's magic cube also has many broken diagonals summing
#correctly:

a <- allsubhypercubes(hendricks)
ld <- function(a){length(dim(a))}

jj <- unlist(lapply(a,ld))
f <- function(i){is.perfect(a[[which(jj==2)[i]]])}
all(sapply(1:sum(jj==2),f))

#but this is NOT enough to ensure that it is pandiagonal (but I
#think hendricks is pandiagonal).


is.alicehypercube(magichypercube.4n(1,d=5),4,give.answers=TRUE)




