library(unitizer)


### Name: filename_to_storeid
### Title: Create a Store ID from a Test File Name
### Aliases: filename_to_storeid

### ** Examples

filename_to_storeid(file.path("tests", "unitizer", "foo.R"))
filename_to_storeid(file.path("tests", "unitizer", "boo.r"))
# does not end in [rR]
filename_to_storeid(file.path("tests", "unitizer", "boo"))



