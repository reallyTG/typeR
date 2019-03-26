library(gmp)


### Name: bigq
### Title: Large sized rationals
### Aliases: bigq bigq-class as.bigq is.bigq as.character.bigq
###   as.double.bigq print.bigq is.na.bigq as.bigz.bigq denominator
###   denominator<- numerator numerator<-
### Keywords: arith

### ** Examples

x <- as.bigq(21,6)
x
# 7 / 2
# Wow ! result is simplified.

y <- as.bigq(5,3)

# addition works !
x + y

# You can even try multiplication, division...
x * y / 13

# and, since May 2012,
x ^ 20
stopifnot(is.bigq(x), is.bigq(x + y),
	  x ^ 20 == as.bigz(7)^20 / 2^20)

# convert to string, double
as.character(x)
as.double(x)

# Depict the "S4-class" bigq, i.e., the formal (S4) methods:
if(require("Rmpfr")) # mostly interesting there
  showMethods(class="bigq")



