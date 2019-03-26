library(Rmpfr)


### Name: roundMpfr
### Title: Rounding to Binary bits, "mpfr-internally"
### Aliases: roundMpfr setPrec
### Keywords: arith

### ** Examples

 (p1 <- Const("pi", 100)) # 100 bit prec
 roundMpfr(p1, 120) # 20 bits more, but "random noise"
 Const("pi", 120)   # same "precision", but really precise
## Don't show: 
 stopifnot(120 == getPrec(roundMpfr(p1, 120)),
            75 == getPrec(roundMpfr(p1,  75)))
## End(Don't show)



