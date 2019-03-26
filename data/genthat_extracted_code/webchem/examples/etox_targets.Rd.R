library(webchem)


### Name: etox_targets
### Title: Get Quality Targets from a ETOX ID
### Aliases: etox_targets

### ** Examples

## Not run: 
##D id <- get_etoxid('Triclosan', match = 'best')
##D out <- etox_targets(id)
##D out[ , c('Substance', 'CAS_NO', 'Country_or_Region', 'Designation',
##D 'Value_Target_LR', 'Unit')]
##D etox_targets( c("20179", "9051"))
##D 
## End(Not run)



