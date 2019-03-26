library(Rdpack)


### Name: Rdreplace_section
### Title: Replace the contents of a section in one or more Rd files
### Aliases: Rdreplace_section
### Keywords: RdoBuild

### ** Examples

## Not run: 
##D # replace the author in all Rd files except pkgname-package
##D Rdreplace_section("A. Author", "author", ".*[.]Rd$", exclude = "-package[.]Rd$")
## End(Not run)



