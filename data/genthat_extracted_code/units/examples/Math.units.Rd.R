library(units)


### Name: Math.units
### Title: Mathematical operations for units objects
### Aliases: Math.units

### ** Examples

# roundings, cummulative functions
x <- set_units(sqrt(1:10), m/s)
signif(x, 2)
cumsum(x)

# trigonometry
sin(x) # not meaningful
x <- set_units(sqrt(1:10), rad)
sin(x)
cos(x)
x <- set_units(seq(0, 1, 0.1), 1)
asin(x)
acos(x)

# logarithms
x <- set_units(sqrt(1:10), W)
log(x) # base exp(1)
log(x, base = 3)
log2(x)
log10(x)
set_units(x, dBW) # decibel-watts
set_units(x, dBm) # decibel-milliwatts



