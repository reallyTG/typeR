library(openssl)


### Name: bignum
### Title: Big number arithmetic
### Aliases: bignum bignum_mod_exp bignum_mod_inv

### ** Examples

# create a bignum
x <- bignum(123L)
y <- bignum("123456789123456789")
z <- bignum("D41D8CD98F00B204E9800998ECF8427E", hex = TRUE)

# Basic arithmetic
div <- z %/% y
mod <- z %% y
z2 <- div * y + mod
stopifnot(z2 == z)
stopifnot(div < z)



