library(nat.templatebrains)


### Name: add_reg_folders
### Title: Set or list local folders containing registrations for
###   nat.templatebrains
### Aliases: add_reg_folders extra_reg_folders

### ** Examples


## Not run: 
##D   add_reg_folders("myextraregistrations")
## End(Not run)
# adding a non-existent folder will generate an error
tools::assertError(add_reg_folders(tempfile()))



