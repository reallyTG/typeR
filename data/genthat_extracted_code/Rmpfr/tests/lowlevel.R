#### Low level stuff - debugging etc
#### =========         =========

require("Rmpfr")
options(warn = 2)# warning -> error

identical3 <- function(x,y,z)	  identical(x,y) && identical (y,z)
identical4 <- function(a,b,c,d)   identical(a,b) && identical3(b,c,d)

###----- _1_ mpfr1 , import, xport etc -----------------------------------------
i8 <- mpfr(-2:5, 32)
x4 <- mpfr(c(NA, NaN, -Inf, Inf), 32); x4 # NA -> NaN as well
stopifnot(identical3(is.na(x4), is.nan(x4), c(T,T,F,F)))

o1 <- as(x4[1], "mpfr1")
stopifnot(is(o1, "mpfr1")) # failed previously
validObject(o1)            # ditto (failed on 64-bit only)

stopifnot(
    getPrec("0xabc", base=16, doNumeric=FALSE) == 3*4,
    getPrec(  "abc", base=16, doNumeric=FALSE) == 3*4,
    getPrec("0b1001", base=2, doNumeric=FALSE) == 4,
    getPrec(  "1001", base=2, doNumeric=FALSE) == 4,
    identical3(mpfr("0b101", base= 2),
               mpfr(  "101", base= 2), mpfr(5, precBits = 3))
   ,
    identical3(mpfr("0xabc", base=16),
               mpfr(  "abc", base=16), mpfr(2748, base=16, precBits = 12))
)


###----- _2_ Debugging, changing MPFR defaults, .. -----------------------------
##  NB: Currently mostly  *not* documented, not even .mpfr.erange()

stopifnot(Rmpfr:::.mpfr.debug() == 0 # the default level
	  ## Activate debugging level 1:
	  , Rmpfr:::.mpfr.debug(1) == 0 # the previous level
	  ## and check it :
	  , Rmpfr:::.mpfr.debug() == 1 # the current level
)

r <- mpfr(7, 100)^-1000
r
## (same as without debugging)

## where as this does print info: -- notably the very large values [3..6]:
.eranges <- function() sapply(names(Rmpfr:::.erange.codes), .mpfr.erange)
## now returning *double* - which loses some precision [ending in '04' instead of '03']:
formatC(.eranges(), format="fg")

.mpfr.minPrec()
.mpfr.maxPrec()# debug printing shows the long integer (on 64 bit)

## Now, level 2 :
stopifnot(Rmpfr:::.mpfr.debug(2) == 1)
r
## with quite a bit of output

r2 <- r^100
r2
L <- r^-100000
L3 <- L^3
str(L3, internal=TRUE)
## Class 'mpfr' [package "Rmpfr"] of length 1 and precision 100
##  internally @.Data: List of 1
##  $ :Formal class 'mpfr1' [package "Rmpfr"] with 4 slots
##   .. ..@ prec: int 100
##   .. ..@ exp : int [1:2] 842206477 0
##   .. ..@ sign: int 1
##   .. ..@ d   : int [1:4] 268435456 761715680 1492345294 -1000766770
str(L3)
## lots of debugging output, then
## 1.00989692356e253529412
##              ^~~~~~~~~~ 10 ^ 253'529'412 that is humongous
if(!interactive()) # not seg.faulting,  but printing a *huge* line
  show(L3)
## segmentation fault -- randomly; 2017-06: no longer see any problem, not even with
if(FALSE) ## well, not really, definitely not interactively for now
if(interactive())
    for(i in 1:256) show(L3)
##

## quite platform dependent {valgrind ==> bug? even in mpfr/gmp/.. ?}
str(.mpfr2list(x4))
x4 ## "similar info" as .mpfr2list(.)

## Increase maximal exponent:

tools:::assertWarning(
    .mpfr.erange.set("Emax", 5e18)) # too large {FIXME why only warning and not error ??}
.mpfr.erange("Emax") # is unchanged
if(4e18 < .mpfr.erange("max.emax")) {
    .mpfr.erange.set("Emax", 4e18) # now ok:
    stopifnot(.mpfr.erange("Emax") == 4e18)
}


## revert to no debugging:
stopifnot(Rmpfr:::.mpfr.debug(0) == 2)
.mpfr.maxPrec()

L / (r2^-1000)# 1.00000....448  (could be more accurate?)

stopifnot(
    all.equal(L, r2^-1000, tol= 1e-27), # why not more accurate?
    all.equal(log(L), -100000 * (-1000) * log(7),
              tol = 1e-15)
)

## Now, our experimental "transport vehicle":
stopifnot(length(rv <- c(r, r2, L)) == 3)

str(mpfrXport(rv))
str(mpfrXport(mpfr(2, 64)^(-3:3)))
str(mpfrXport(Const("pi")* 2^(-3:3)))

## and a very large one
mil <- mpfr(1025, 111)
str(mm <- mpfrXport(xx <- mil^(2^25)))
stopifnot(all.equal(log2(xx) * 2^-25, log2(mil), tol=1e-15))


## Bill Dunlap's example (with patch about convert S_alloc bug):
##               (precision increases, then decreases)
z <- c(mpfr(1,8)/19, mpfr(1,32)/19, mpfr(1,24)/19)
cbind(fz <- format(z))
##stopifnot(identical(fz, c("0.05273", "0.052631578947", "0.0526315793")))
## no longer, rather with updated formatMpfr() [2017-12]:
stopifnot(identical(fz, c("0.0527",
                          "0.05263157895",
                          "0.05263157934")))

k1 <- mpfr(  c(123, 1234, 12345, 123456), precBits=2)
(N1 <- asNumeric(k1))# 128  1024  12288  131072 -- correct
str(.mpfr2str(k1))
str(.mpfr2str(k1, maybe.full=TRUE, base=10), vec.len=10)
str(.mpfr2str(k1, maybe.full=TRUE, base= 2), vec.len=10)

## MM: --> need_dig is fine  but is not used in the string that is returned !!

(fk1 <- formatMpfr(k1, scientific=FALSE)) # "the bug" --- now fixed!
stopifnot(all.equal(N1, as.numeric(fk1), tol=0))
format(k1, digits=3) # now fine
##
digs <- setNames(1:6, 1:6)
## Each of these are  4 x 6  matrices
ffix <- sapply(digs, function(d) format(k1, digits = d, scientific = FALSE)) ## *not* good at all ..
## ==> need a maybe.full=TRUE   even here
ff   <- sapply(digs, function(d) format(k1, digits = d))# sci..fic = NA -- digits=1 failing for '128'
fsci <- sapply(digs, function(d) format(k1, digits = d, scientific = TRUE)) # perfect
stopifnot(exprs = {
    length(dd <- dim(ff)) == 2
    identical(dd, dim(ffix))
    identical(dd, dim(fsci))
    all.equal(asNumeric(fsci), asNumeric(ffix) -> dmat, tol=0)
    all.equal(asNumeric(ff),   asNumeric(ffix), tol=0)
})
rE <- 1 - dmat / asNumeric(k1)
i <- 1:5
summary(fm <- lm(log10(colMeans(abs(rE)))[i] ~ i))
stopifnot(exprs = {
    rE[ cbind(FALSE, upper.tri(rE)[,-6]) ] == 0
    abs(residuals(fm)) < 0.15
})


## Bug example from RMH 2018-03-16 :
(x <- mpfr(c(65, 650, 6500, 65000, 650000), precBits=6))
data.frame(fDec = formatDec(x), f = formatMpfr(x))
x. <- as.numeric(xDec <- formatDec(x))
stopifnot(abs(x - x.) <= c(0, 0, 2, 12, 360))
