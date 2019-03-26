library(units)


### Name: deparse_unit
### Title: deparse unit to string in product power form (e.g. km m-2 s-1)
### Aliases: deparse_unit as_cf

### ** Examples

u = as_units("kg m-2 s-1", implicit_exponents = TRUE)
u
deparse_unit(u)



