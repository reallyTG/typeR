library(hutils)


### Name: all_same_sign
### Title: Determine whether a vector is all of the same sign
### Aliases: all_same_sign

### ** Examples

all_same_sign(1:10)
all_same_sign(1:10 - 1)
all_same_sign(0)
all_same_sign(NA)
all_same_sign(c(NA, 1))
all_same_sign("surprise?")
all_same_sign(c(0, 0.1 + 0.2 - 0.3))

if (requireNamespace("microbenchmark", quietly = TRUE)) {
  library(microbenchmark)
  microbenchmark(base = length(unique(sign(1:1e5), nmax = 3)) == 1L, 
                 all_same_sign(1:1e5))
}
# Unit: microseconds
#                   expr  min   lq mean median   uq  max neval cld
#                   base 2012 2040 2322   2047 2063 9324   100   b
# all_same_sign(1:1e+05)   86   86   94     89   93  290   100  a 




