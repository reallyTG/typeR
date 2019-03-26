library(swirlify)


### Name: unpack_course
### Title: Unpack an '.swc' file into a swirl course
### Aliases: unpack_course

### ** Examples

## Not run: 
##D # Unpack a course and interactively choose a .swc file
##D unpack_course()
##D 
##D # Unpack a course where the .swc file is explicitly specified
##D unpack_course(file.path("~", "Desktop", "R_Programming.swc"))
##D 
##D # Unpack a course and specify where the .swc file is located and where the
##D # course should be exported.
##D unpack_course(file.path("~", "Desktop", "R_Programming.swc"),
##D  file.path("~", "Developer", "swirl"))
## End(Not run)



