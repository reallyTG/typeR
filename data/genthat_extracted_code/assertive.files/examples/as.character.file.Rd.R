library(assertive.files)


### Name: as.character.file
### Title: Convert file connections to strings
### Aliases: as.character.file

### ** Examples

rprofile <- file.path(R.home("etc"), "Rprofile.site")
fcon <- file(rprofile)
assertive.base::assert_all_are_true(identical(as.character(fcon), rprofile))
close(fcon)



