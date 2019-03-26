library(crunch)


### Name: newProject
### Title: Create a new project
### Aliases: newProject

### ** Examples

## Not run: 
##D proj <- newProject("A project name")
##D # That is equivalent to doing:
##D p <- projects()
##D p[["A project name"]] <- list()
##D proj <- p[["A project name"]]
##D 
##D proj2 <- newProject("Another project", members="you@yourco.com")
##D # That is equivalent to doing:
##D p[["Another project"]] <- list(members="you@yourco.com")
##D proj <- p[["Another project"]]
## End(Not run)



