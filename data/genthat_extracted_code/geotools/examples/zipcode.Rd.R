library(geotools)


### Name: codesNearToCode
### Title: Getting city near to others
### Aliases: codesNearToCode cityNearToCode cities zipCode
### Keywords: geo

### ** Examples

## get "Paris"
cities(75000)

## inverse: get 75000: postal code for Paris
zipCode("Paris")

## all postal code at 7 kms from Paris
codesNearToCode(75000,7)

## idem, with city name
cityNearToCode(75000,7)



