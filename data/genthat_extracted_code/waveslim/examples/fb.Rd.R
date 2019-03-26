library(waveslim)


### Name: Dual-tree Filter Banks
### Title: Filter Banks for Dual-Tree Wavelet Transforms
### Aliases: afb afb2D afb2D.A sfb sfb2D sfb2D.A
### Keywords: ts

### ** Examples

## EXAMPLE: afb, sfb
af = farras()$af
sf = farras()$sf
x = rnorm(64)
x.afb = afb(x, af)
lo = x.afb$lo
hi = x.afb$hi
y = sfb(lo, hi, sf)
err = x - y
max(abs(err))

## EXAMPLE: afb2D, sfb2D
x = matrix(rnorm(32*64), 32, 64)
af = farras()$af
sf = farras()$sf
x.afb2D = afb2D(x, af, af)
lo = x.afb2D$lo
hi = x.afb2D$hi
y = sfb2D(lo, hi, sf, sf)
err = x - y
max(abs(err))

## Example: afb2D.A, sfb2D.A
x = matrix(rnorm(32*64), 32, 64)
af = farras()$af
sf = farras()$sf
x.afb2D.A = afb2D.A(x, af, 1)
lo = x.afb2D.A$lo
hi = x.afb2D.A$hi
y = sfb2D.A(lo, hi, sf, 1)
err = x - y
max(abs(err))



