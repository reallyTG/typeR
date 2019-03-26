library(units)


### Name: as_units
### Title: convert object to a units object
### Aliases: as_units as_units.default as_units.difftime make_units
###   as_units.character as_units.call

### ** Examples

s = Sys.time()
d  = s - (s+1)
as_units(d)
# The easiest way to assign units to a numeric vector is like this: 
x <- y <- 1:4
units(x) <- "m/s"  # meters / second

# Alternatively, the easiest pipe-friendly way to set units:
if(requireNamespace("magrittr", quietly = TRUE)) {
  library(magrittr)
  y %>% set_units(m/s)
} 

# these are different ways of creating the same unit:
# meters per second squared, i.e, acceleration
x1 <- make_units(m/s^2)
x2 <- as_units(quote(m/s^2))
x2 <- as_units("m/s^2")
x3 <- as_units("m s-2") # in product power form, i.e., implicit exponents = T
x4 <- set_units(1,  m/s^2) # by default, mode = "symbols"
x5 <- set_units(1, "m/s^2",   mode = "standard")
x6 <- set_units(1, x1,        mode = "standard")
x7 <- set_units(1, units(x1), mode = "standard")
x8 <- as_units("m") / as_units("s")^2

all_identical <- function(...) {
  l <- list(...)
  for(i in seq_along(l)[-1])
    if(!identical(l[[1]], l[[i]]))
      return(FALSE)
  TRUE
}
all_identical(x1, x2, x3, x4, x5, x6, x7, x8)

# Note, direct usage of these unit creation functions is typically not 
# necessary, since coercion is automatically done via as_units(). Again, 
# these are all equivalent ways to generate the same result.

x1 <- x2 <- x3 <- x4 <- x5 <- x6 <- x7 <- x8 <- 1:4
units(x1) <- "m/s^2"
units(x2) <- "m s-2"
units(x3) <- quote(m/s^2)
units(x4) <- make_units(m/s^2)
units(x5) <- as_units(quote(m/s^2))
x6 <- set_units(x6, m/s^2)
x7 <- set_units(x7, "m/s^2", mode = "standard")
x8 <- set_units(x8, units(x1), mode = "standard")

all_identical(x1, x2, x3, x4, x5, x6, x7, x8)


# Both unit names or symbols can be used. By default, unit names are
# automatically converted to unit symbols.
make_units(degree_C)
make_units(kilogram)
make_units(ohm)
# Note, if the printing of non-ascii characters is garbled, then you may
# need to specify the encoding on your system manually like this:
# ud_set_encoding("latin1")
# not all unit names get converted to symbols under different encodings

## Arithmetic operations and units
# conversion between unit objects that were defined as symbols and names will
# work correctly, although unit simplification in printing may not always occur.
x <- 500 * make_units(micrograms/liter)
y <- set_units(200, ug/l)
x + y
x * y # numeric result is correct, but units not simplified completely

# note, plural form of unit name accepted too ('liters' vs 'liter'), and
# denominator simplification can be performed correctly
x * set_units(5, liters)

# unit conversion works too
set_units(x, grams/gallon)

## Creating custom, user defined units
# For example, a microbiologist might work with counts of bacterial cells
# make_units(cells/ml) # by default, throws an ERROR
# First define the unit, then the newly defined unit is accepted.
install_symbolic_unit("cells")
make_units(cells/ml) 

# Note, install_symbolic_unit() does not add any support for unit
# conversion, or arithmetic operations that require unit conversion. See
# ?install_conversion_constant for defining relationships between user 
# defined units.

## set_units()
# set_units is a pipe friendly version of `units<-`. 
if(requireNamespace("magrittr", quietly = TRUE)) {
  library(magrittr)
  1:5 %>% set_units(N/m^2)
  # first sets to m, then converts to km
  1:5 %>% set_units(m) %>% set_units(km)
}

# set_units has two modes of operation. By default, it operates with 
# bare symbols to define the units.
set_units(1:5, m/s)

# use `mode = "standard"` to use the value of supplied argument, rather than
# the bare symbols of the expression. In this mode, set_units() can be
# thought of as a simple alias for `units<-` that is pipe friendly.
set_units(1:5, "m/s", mode = "standard")
set_units(1:5, make_units(m/s), mode = "standard")

# the mode of set_units() can be controlled via a global option
# units_options(set_units_mode = "standard")

# To remove units use
units(x) <- NULL
# or
set_units(x, NULL)
# or
drop_units(y)



