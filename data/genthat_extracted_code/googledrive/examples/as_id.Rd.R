library(googledrive)


### Name: as_id
### Title: Extract and/or mark as file id
### Aliases: as_id

### ** Examples

as_id("123abc")
as_id("https://docs.google.com/spreadsheets/d/qawsedrf16273849/edit#gid=12345")

## Not run: 
##D x <- drive_find(n_max = 3)
##D as_id(x)
##D 
##D x <- drive_get("foofy")
##D as_id(x)
##D 
##D x <- team_drive_find("work-stuff")
##D as_id(x)
## End(Not run)



