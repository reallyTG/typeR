library(dapr)


### Name: vap
### Title: vap: Vector apply functions
### Aliases: vap vap_dbl vap_chr vap_lgl vap_int

### ** Examples


## character
vap_chr(letters, ~ paste0(.x, "."))

## double
vap_dbl(rnorm(4), round, 3)

## logical
vap_lgl(letters, ~ .x %in% c("a", "e", "i", "o", "u"))

## integer
vap_int(rnorm(5), ~ as.integer(.x))




