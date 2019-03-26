library(gmp)


### Name: bigz
### Title: Large Sized Integer Values
### Aliases: bigz bigz-class as.bigz is.bigz as.character.bigz
###   as.double.bigz print.bigz is.na.bigz biginteger_as
###   biginteger_as_character
### Keywords: arith

### ** Examples

## 1+1=2
a <- as.bigz(1)
a + a

## Two non-small Mersenne primes:
two <- as.bigz(2)
p1 <- two^107 -1 ; isprime(p1); p1
p2 <- two^127 -1 ; isprime(p2); p2


## Calculate c = x^e mod n
## --------------------------------------------------------------------
x <- as.bigz("0x123456789abcdef") # my secret message
e <- as.bigz(3) # something smelling like a dangerous public RSA exponent
(n <- p1 * p2) #  a product of two primes
as.character(n, b=16)# as both primes were Mersenne's..

## recreate the three numbers above [for demo below]:
n. <- n; x. <- x; e. <- e # save
Rev <- function() { n <<- n.; x <<- x.; e <<- e.}

# first way to do it right
modulus(x) <- n
c <- x ^ e ; c ; Rev()

# similar second way (makes more sense if you reuse e) to do it right
modulus(e) <- n
c2 <- x ^ e
stopifnot(identical(c2, c), is.bigz(c2)) ; Rev()

# third way to do it right
c3 <- x ^ as.bigz(e, n) ; stopifnot(identical(c3, c))

# fourth way to do it right
c4 <- as.bigz(x, n) ^ e ; stopifnot(identical(c4, c))

# WRONG! (although very beautiful. Ok only for very small 'e' as here)
cc <- x ^ e %% n
cc == c

# Return result in hexa
as.character(c, b=16)

# Depict the "S4-class" bigz, i.e., the formal (S4) methods:
if(require("Rmpfr")) # mostly interesting there
  showMethods(class="bigz")



