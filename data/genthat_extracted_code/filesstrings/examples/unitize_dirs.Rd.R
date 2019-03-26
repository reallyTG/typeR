library(filesstrings)


### Name: unitize_dirs
### Title: Put files with the same unit measurements into directories
### Aliases: unitize_dirs

### ** Examples

## Not run: 
##D dir.create("UnitDirs_test")
##D setwd("UnitDirs_test")
##D files <- c("1litres_1.txt", "1litres_3.txt", "3litres.txt", "5litres_1.txt")
##D file.create(files)
##D unitize_dirs("litres", "\\.txt")
##D setwd("..")
##D dir.remove("UnitDirs_test")
## End(Not run)



