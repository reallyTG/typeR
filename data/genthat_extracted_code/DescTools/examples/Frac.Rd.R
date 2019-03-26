library(DescTools)


### Name: Frac
### Title: Fractional Part and Maximal Digits of a Numeric Value
### Aliases: Frac MaxDigits Ndec Prec
### Keywords: arith

### ** Examples

x <- rnorm(5)*100
x
Frac(x)

# multiply by 10^4
Frac(x, dpwr=4)

MaxDigits(c(1.25, 1.8, 12.0, 1.00000))

x <- c("0.0000", "0", "159.283", "1.45e+10", "1.4599E+10" )
Ndec(x)
Prec(as.numeric(x))



