library(countrycode)


### Name: countrycode
### Title: Converts long country names into one of many different coding
###   schemes. Translates from one scheme to another. Converts country name
###   or coding scheme to the official short English country name. Creates
###   a new variable with the name of the continent or region to which each
###   country belongs.
### Aliases: countrycode
### Keywords: countrycode

### ** Examples

# ISO to Correlates of War
countrycode(c('USA', 'DZA'), 'iso3c', 'cown')
# English to ISO
countrycode('Albania', 'country.name', 'iso3c')
# German to French
countrycode('Albanien', 'country.name.de', 'iso.name.fr')



