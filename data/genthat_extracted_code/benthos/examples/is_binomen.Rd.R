library(benthos)


### Name: is_binomen
### Title: Binomial Names 'is_binomial' tests for valid binomial names,
###   'generic_name' extracts the genus to which the species belongs,
###   'specific_name' extracts the species within the genus.
### Aliases: is_binomen generic_name specific_name strip_sp

### ** Examples

 is_binomen("Venerupis corrugata") # TRUE
 generic_name("Venerupis corrugata") # Venerupis
 specific_name("Venerupis corrugata") # corrugata
 generic_name("venerupis corrugata") # NA (genus part should be capitalized)




