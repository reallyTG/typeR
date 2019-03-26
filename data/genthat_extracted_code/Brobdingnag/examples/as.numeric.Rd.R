library(Brobdingnag)


### Name: as.numeric
### Title: Coerces to numeric or complex form
### Aliases: as.numeric as.complex as.numeric,brob-method
###   as.complex,brob-method as.numeric,glub-method as.complex,glub-method
###   coerce,brob,numeric-method coerce,brob,complex-method
###   coerce,glub,numeric-method coerce,glub,complex-method
### Keywords: math

### ** Examples

a <- as.brob(1:10)
a <- cbrob(a, as.brob(10)^1e26)
a
as.numeric(a)

as.complex(10i + a)




