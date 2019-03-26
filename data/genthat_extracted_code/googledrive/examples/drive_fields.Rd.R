library(googledrive)


### Name: drive_fields
### Title: Request partial resources
### Aliases: drive_fields prep_fields

### ** Examples

## get a tibble of all fields for the Files resource + indicator of defaults
drive_fields(expose())

## invalid fields are removed and throw warning
drive_fields(c("name", "parents", "ownedByMe", "pancakes!"))

## prepare fields for query
prep_fields(c("name", "parents", "kind"))



