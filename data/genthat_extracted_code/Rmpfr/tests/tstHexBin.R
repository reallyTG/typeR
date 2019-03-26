require(Rmpfr)
sessionInfo()

nums <- c(0, .625, .1, .3, .3125, .5, .6, (.3+.6), .9, 1, 3.3125)
nums9 <- mpfr(nums, precBits = 9)

n5.b2 <- mpfr("101", base=2)
stopifnot(identical(n5.b2, mpfr(5, precBits=3)),
          identical(n5.b2, mpfr("0b101", base=2)))
if(FALSE)## 0b101  could also be a Hex number with no initial '0x' -- hence NOT true:
identical(n5.b2, mpfr("0b101"))
## We *could* say that  anything starting with '0b' is binary, anything with '0x' is hexadecimal


### mpfr.Bcharacter() method [was 'mpfrBchar', was 'scanBin'] :

##' Check the inverse of formatBin(), i.e., mpfr() working correctly
chkInv.fBin <- function(x, ...) {
    stopifnot(is(x, "mpfr"))
    nb <- formatBin(x, ...)
    xx <- mpfr(nb)
    ## Inverse should work {apart from 0: that is not uniquely represented in MPFR!}
    stopifnot(identical(mpfrIs0(x ) -> i0,
                        mpfrIs0(xx)),
              identical(x[!i0], xx[!i0]))
    invisible(nb)
}
(nums9bc <- chkInv.fBin(nums9))
(nums9bF <- chkInv.fBin(nums9, scientific=FALSE)) # "F": Fixed format (as in Fortran)

## higher precision, 0,Inf, sign change:
(i12 <- 1 / mpfr(c(-2:12, Inf), 64))
(i12.50 <- roundMpfr(i12, precBits=50)) # "same", with 50 (< 53) bits
try({ ## FIXME -- formatBin() bug -- fails for 'Inf' !
(nI.12    <- chkInv.fBin(i12   ))
(nI.12.50 <- chkInv.fBin(i12.50))
})
ii <- mpfr(c(-Inf, 17, Inf), 7)
formatHex(ii) ## fine
formatDec(ii) ## not 100% ok, as it has "." [FIXME ?]

n9. <- Rmpfr:::mpfr.Ncharacter(nums9bc)
n9_ <- mpfr(nums9bc)
## Inverse worked {apart from 0: it is not at all uniquely represented in MPFR!}
stopifnot(identical(mpfrIs0(n9.), mpfrIs0(n9_)),
          all.equal(n9_, n9., tolerance=0),
          identical(nums9[-1], n9.[-1]))

mpfr(nums9bc, precBits=5)

(n9.5 <- mpfr(nums9bF, scientific=FALSE, precBits=5))
stopifnot(all.equal(n9.5, mpfr(nums9bF, precBits=5), tol=0))
stopifnot(all.equal(n9., n9.5, tol = 0.02), getPrec(n9.5) == 5)
mpfr(nums9bF, scientific=FALSE)
mpfr(nums9bF)

### mpfr() -> mpfrHchar (was 'scanHex') :
nums9hc <- formatHex(nums9)
stopifnot(all.equal(n9.,  mpfr(nums9hc),             tol = 0),
          all.equal(n9.5, mpfr(nums9hc, precBits=5), tol = 0))

### Rest from ../R/formatHex.R -- heavily modified

(m32 <- matrix(0:31, 8, 4, dimnames = list(0:7, c(0,8,16,24))))
FourBits <- mpfr(m32, precBits=4)
FiveBits <- mpfr(m32, precBits=5)
stopifnot(all.equal(m32, asNumeric(FiveBits), tol=0),
          all.equal(m32, asNumeric(FourBits), tol= 0.05))

## HH:::formatHexInternal(FourBits)
formatHex(FourBits)
formatHex(FourBits, precBits=5)
formatHex(FourBits, precBits=6)
formatBin(FourBits)
formatBin(FourBits, precBits=5)
formatBin(FourBits, scientific=FALSE)
formatBin(FourBits, scientific=FALSE, precBits=5)
formatDec(FourBits)
formatDec(FourBits, precBits=5)
formatDec(FourBits, precBits=7)

## HH:::formatHexInternal(FiveBits)
formatHex(FiveBits)
formatHex(FiveBits, precBits=5)
formatHex(FiveBits, precBits=6)
formatBin(FiveBits)
formatBin(FiveBits, precBits=5)
formatBin(FiveBits, precBits=6)
formatBin(FiveBits, scientific=FALSE)
formatBin(FiveBits, scientific=FALSE, precBits=6)
formatDec(FiveBits)
formatDec(FiveBits, precBits=5)
formatDec(FiveBits, precBits=7)

TenPowers <- mpfr(matrix(10^(-3:5)), precBits=53)
row.names(TenPowers) <- -3:5
TenPowers

options(width = 180) # for several "wide" displays below

## This indirectly "checks'  as.data.frame.Ncharacter():
mkDF <- function(mv, displaydigits = 4, stringsAsFactors = FALSE) {
    stopifnot(is.numeric(mv) || inherits(mv, "mpfr"))
    data.frame(Hex = formatHex(mv),
               Bin = formatBin(mv),
               BinF= formatBin(mv, scientific=FALSE),
               Dec = formatDec(mv),
               Dec4= formatDec(mv, displaydigits=displaydigits),
               Dec.= formatDec(mv, scientific=TRUE),
               Dec.4=formatDec(mv, scientific=TRUE, displaydigits=displaydigits),
               stringsAsFactors = stringsAsFactors)
}
nmsMkDF <- c("Hex", "Bin", "BinF", "Dec", "Dec4", "Dec.", "Dec.4")

 d10p. <- mkDF(TenPowers)
(d10p  <- mkDF(as.vector(TenPowers)))


TenFrac <- matrix((1:10)/10, dimnames=list(1:10, expression(1/x)))
TenFrac
formatHex(TenFrac)
formatBin(TenFrac)
formatBin(TenFrac, scientific=FALSE)
formatDec(TenFrac)

TenFrac9 <- mpfr(TenFrac, precBits=9)
TenFrac9
data.frame(Hex = formatHex(TenFrac9), ## checking as.data.frame.Ncharacter as well
           Bin = formatBin(TenFrac9),
           BinF= formatBin(TenFrac9, scientific=FALSE),
           Dec = formatDec(TenFrac9)) -> d9
d9
##
stopifnot(getPrec(TenFrac ) == 53,
	  getPrec(TenFrac9) ==  9,
	  inherits(d9, "data.frame"), all.equal(dim(d9), c(10,4)))

(Ten <- matrix(1:10 + 0.0, dimnames=list(1:10, "x"))) ## + 0.0 forces double precision

dT <- mkDF(Ten)
dt <- mkDF(as.vector(Ten))
dt # large

(Ten4 <- mpfr(Ten, precBits=4))
ten4 <- as.vector(Ten4)
 D4 <- mkDF(Ten4)  # would be  printing "x"  --- because we added one-column matrices !!
(d4 <- mkDF(ten4)) # printing fine !
stopifnot(identical(names(d4), names(D4)),
          identical(names(d4), nmsMkDF))



Two8 <- matrix(2^seq(-8, 8))
Two8.3 <- mpfr(Two8, precBits=3)
## formatBin
stopifnot(
    identical(sapply(as(Two8.3, "mpfr")[-c(1:3, 15:17)],
                     function(t83) formatBin(t83, scientific=FALSE)),
              c("+0b.____100", "+0b.___100", "+0b.__100", "+0b._100", "+0b.100",
		"+0b1.00","+0b10.0","+0b100.","+0b100_.","+0b100__.","+0b100___.")))
## formatDec --- these must be perfectly aligned on the "." !
formatDec(Two8.3, digits = 3)
formatDec(Two8.3, digits = 8)
stopifnot(
    identical(capture.output(formatDec(Two8.3, digits = 3))[2:4],
              c(" [1,]   0.00391", " [2,]   0.00781", " [3,]   0.0156 "))
   ,
    identical(capture.output(formatDec(Two8.3, digits = 8))[c(2:3,8,13,16)],
	      c(" [1,]   0.0039062500", " [2,]   0.0078125000", " [7,]   0.25000000  ",
	        "[12,]   8.0000000   ", "[15,]  64.000000    "))
)


