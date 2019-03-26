library(diptest)


### Name: dip
### Title: Compute Hartigans' Dip Test Statistic for Unimodality
### Aliases: dip
### Keywords: htest distribution

### ** Examples

data(statfaculty)
plot(density(statfaculty))
rug(statfaculty, col="midnight blue"); abline(h=0, col="gray")
dip(statfaculty)
(dS <- dip(statfaculty, full = TRUE, debug = TRUE))
plot(dS)
## even more output -- + plot showing "global" GCM/LCM:
(dS2 <- dip(statfaculty, full = "all", debug = 3))
plot(dS2)

data(faithful)
fE <- faithful$eruptions
plot(density(fE))
rug(fE, col="midnight blue"); abline(h=0, col="gray")
dip(fE, debug = 2) ## showing internal work
(dE <- dip(fE, full = TRUE)) ## note the print method
plot(dE, do.points=FALSE)

data(precip)
plot(density(precip))
rug(precip, col="midnight blue"); abline(h=0, col="gray")
str(dip(precip, full = TRUE, debug = TRUE))

##-----------------  The  'min.is.0' option :  ---------------------

##' dip(.) continuity and 'min.is.0' exploration:
dd <- function(x, debug=FALSE) {
   x_ <- x ; x_[1] <- 0.9999999999 * x[1]
   rbind(dip(x , debug=debug),
         dip(x_, debug=debug),
         dip(x , min.is.0=TRUE, debug=debug),
         dip(x_, min.is.0=TRUE, debug=debug), deparse.level=2)
}

dd( rep(1, 8) ) # the 3rd one differs ==> min.is.0=TRUE is *dis*continuous
dd( 1:7 )       # ditto

dd( 1:7, debug=TRUE)
## border-line case ..
dd( 1:2, debug=TRUE)

## Demonstrate that  'min.is.0 = TRUE'  does not change the typical result:
B.sim <- 1000 # or larger
D5  <- {set.seed(1); replicate(B.sim, dip(runif(5)))}
D5. <- {set.seed(1); replicate(B.sim, dip(runif(5), min.is.0=TRUE))}
stopifnot(identical(D5, D5.), all.equal(min(D5), 1/(2*5)))
hist(D5, 64); rug(D5)

D8  <- {set.seed(7); replicate(B.sim, dip(runif(8)))}
D8. <- {set.seed(7); replicate(B.sim, dip(runif(8), min.is.0=TRUE))}
stopifnot(identical(D8, D8.))



