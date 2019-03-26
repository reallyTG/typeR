library(gmp)


### Name: bigz operators
### Title: Basic Arithmetic Operators for Large Integers ("bigz")
### Aliases: add.bigz +.bigz sub.bigz -.bigz mul.bigz *.bigz div.bigz
###   /.bigz mod.bigz %%.bigz %/%.bigz divq.bigz abs.bigz inv.bigz inv
###   pow.bigz pow ^.bigz log.bigz log2.bigz log10.bigz
### Keywords: arith

### ** Examples

# 1+1=2
as.bigz(1) + 1
as.bigz(2)^10
as.bigz(2)^200

# if my.large.num.string is set to a number, this returns the least byte
(my.large.num.string <- paste(sample(0:9, 200, replace=TRUE), collapse=""))
mod.bigz(as.bigz(my.large.num.string), "0xff")

# power exponents can be up to MAX_INT in size, or unlimited if a
# bigz's modulus is set.
pow.bigz(10,10000)

## Modulo 11,   7 and 8 are inverses :
as.bigz(7, mod = 11) * 8 ## ==>  1  (mod 11)
inv.bigz(7, 11)## hence, 8
a <- 1:10
(i.a <- inv.bigz(a, 11))
d <- as.bigz(7)
a %/% d  # = divq(a, d)
a %%  d  # = mod.bigz (a, d)

(ii <- inv.bigz(1:10, 16))
## with 5 warnings (one for each NA)
op <- options("gmp:warnNoInv" = FALSE)
i2 <- inv.bigz(1:10, 16) # no warnings
(i3 <- 1 / as.bigz(1:10, 16))
i4 <- as.bigz(1:10, 16) ^ -1
stopifnot(identical(ii, i2),
	  identical(as.bigz(i2, 16), i3),
	  identical(i3, i4))
options(op)# revert previous options' settings

stopifnot(inv.bigz(7, 11) == 8,
          all(as.bigz(i.a, 11) * a == 1),
          identical(a %/% d, divq.bigz(1:10, 7)),
          identical(a %%  d, mod.bigz (a, d))
 )




