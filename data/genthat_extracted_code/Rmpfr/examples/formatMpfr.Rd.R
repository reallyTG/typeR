library(Rmpfr)


### Name: formatMpfr
### Title: Formatting MPFR (multiprecision) Numbers
### Aliases: formatMpfr formatN.mpfr
### Keywords: character print

### ** Examples

 ## Printing of MPFR numbers  uses formatMpfr() internally.
 ## Note how each components uses the "necessary" number of digits:
 ( x3 <- c(Const("pi", 168), mpfr(pi, 140), 3.14) )
 format(x3[3], 15)
 format(x3[3], 15, drop0 = TRUE)# "3.14" .. dropping the trailing zeros
 x3[4] <- 2^30
 x3[4] # automatically drops trailing zeros
 format(x3[1], dig = 41, small.mark = "'") # (41 - 1 = ) 40 digits after "."

 rbind(formatN(           x3,  digits = 15),
       formatN(as.numeric(x3), digits = 15))

 (Zero <- mpfr(c(0,1/-Inf), 20)) # 0 and "-0"
 xx <- c(Zero, 1:2, Const("pi", 120), -100*pi, -.00987)
 format(xx, digits = 2)
 format(xx, digits = 1, showNeg0 = FALSE)# "-0" no longer shown

## Output in other bases :
formatMpfr(mpfr(10^6, 40), base=32, drop0trailing=TRUE)
## "ugi0"
mpfr("ugi0", base=32) #-> 1'000'000
## Don't show: 
stopifnot(
   identical("ugi0", formatMpfr(mpfr(10^6, 40), base=32, drop0trailing=TRUE)),
   mpfr("ugi0", base=32) == 10^6)
## End(Don't show)

i32 <- mpfr(1:32, precBits = 64)
format(i32,   base=  2, drop0trailing=TRUE)
format(i32,   base= 16, drop0trailing=TRUE)
format(1/i32, base=  2, drop0trailing=TRUE)# using scientific notation for [17..32]
format(1/i32, base= 32)
format(1/i32, base= 62, drop0trailing=TRUE)
format(mpfr(2, 64)^-(1:16), base=16, drop0trailing=TRUE)



