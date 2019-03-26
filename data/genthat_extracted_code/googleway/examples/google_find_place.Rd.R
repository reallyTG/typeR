library(googleway)


### Name: google_find_place
### Title: Google Find Place
### Aliases: google_find_place

### ** Examples

## No test: 

## specifying fields
google_find_place(
  input = "Museum of Contemporary Art Australia"
  , fields = c("photos","formatted_address","name","rating","opening_hours","geometry")
)

## Using location bias - circle
google_find_place(
  input = "Mongolian Grill"
  , circle = list(point = c(47.7, -122.2), radius = 2000)
)

## finding by a phone number
google_find_place(
 input = "+61293744000"
 , inputtype = "phonenumber"
)

## End(No test)




