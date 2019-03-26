library(gmDatabase)


### Name: gmClass
### Title: Returning information from geometallurgicala database
### Aliases: gmClass gmClassMembers
### Keywords: databases

### ** Examples

## Not run: 
##D .gmDB <- dbConnect(...)
##D root <- "root"
##D gmClass(root)
##D ## returns information on the root in the database
##D 
##D gmClass(root$project)
##D ## returns information on every project in root in the database
##D 
##D gmClass(var="project")
##D ## returns information on the variable/class project
##D 
##D gmClass(var=2)
##D ## returns information on the variable with variable id 2
## End(Not run)


