library(matR)


### Name: dir.MGRAST
### Title: List directory of projects
### Aliases: dir.MGRAST

### ** Examples

## Not run: 
##D ####  names of all public projects
##D dir.MGRAST()$name
##D 
##D ####  ids of all public projects
##D rownames (dir.MGRAST())
##D 
##D ####  investigators who have contributed public projects
##D unique (dir.MGRAST()$pi)
##D 
##D ####  first 25 projects submitted to MG-RAST
##D dir.MGRAST (len=25, order="id")
##D 
##D ####  detailed information about them
##D names (dir.MGRAST(len=25, order="id", verbosity="verbose"))
##D 
##D ####  quick look at public projects
##D strtrim (dir.MGRAST (verbosity="verbose")$description, 70)
## End(Not run)

####  relevant documentation for the underlying API call
doc.MGRAST (3, head=c('project','query','parameters','options'))



