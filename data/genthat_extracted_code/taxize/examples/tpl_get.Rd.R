library(taxize)


### Name: tpl_get
### Title: Get The Plant List csv files.
### Aliases: tpl_get

### ** Examples

## Not run: 
##D # Get a few families
##D dir <- file.path(tempdir(), "abc")
##D tpl_get(dir, family = c("Platanaceae","Winteraceae"))
##D readLines(file.path(dir, "Platanaceae.csv"), n = 5)
##D 
##D # You can now get Gymnosperms as well
##D dir1 <- file.path(tempdir(), "def")
##D tpl_get(dir1, family = c("Pinaceae","Taxaceae"))
##D 
##D # You can get mosses too!
##D dir2 <- file.path(tempdir(), "ghi")
##D tpl_get(dir2, family = "Echinodiaceae")
##D 
##D # Get all families
##D ## Beware, will take a while
##D ## dir3 <- file.path(tempdir(), "jkl")
##D ## tpl_get("dir3)
## End(Not run)



