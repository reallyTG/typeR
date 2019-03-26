library(charlatan)


### Name: AddressProvider
### Title: AddressProvider
### Aliases: AddressProvider address_provider_locales
### Keywords: datasets internal

### ** Examples

(z <- AddressProvider$new())
z$locale
z$city_suffix()
z$street_suffix()
z$building_number()
z$city()
z$country()
z$street_name()
z$street_address()
z$address()
z$country()
z$country_code()
z$postcode()

# en_GB
(z <- AddressProvider$new('en_GB'))
z$locale
z$locale_data
z$locale_data$postcode_sets
z$postcode
z$postcode()
z$street_name()



