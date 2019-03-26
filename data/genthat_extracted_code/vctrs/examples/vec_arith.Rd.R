library(vctrs)


### Name: vec_arith
### Title: Arithmetic operations
### Aliases: vec_arith vec_arith.default vec_arith.logical
###   vec_arith.numeric vec_arith_base MISSING
### Keywords: internal

### ** Examples

d <- as.Date("2018-01-01")
dt <- as.POSIXct("2018-01-02 12:00")
t <- as.difftime(12, unit = "hours")

vec_arith("-", dt, 1)
vec_arith("-", dt, t)
vec_arith("-", dt, d)

vec_arith("+", dt, 86400)
vec_arith("+", dt, t)
vec_arith("+", t, t)

vec_arith("/", t, t)
vec_arith("/", t, 2)

vec_arith("*", t, 2)



