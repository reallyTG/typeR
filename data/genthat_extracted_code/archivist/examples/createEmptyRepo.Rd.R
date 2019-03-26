library(archivist)


### Name: createLocalRepo
### Title: Create an Empty Repository
### Aliases: createLocalRepo createPostgresRepo createEmptyRepo

### ** Examples

## Not run: 
##D exampleRepoDir <- tempfile()
##D createLocalRepo( repoDir = exampleRepoDir, default =  TRUE )
##D data(iris)
##D saveToLocalRepo(iris)
##D showLocalRepo()
##D showLocalRepo(method = "tags")
##D deleteLocalRepo( repoDir = exampleRepoDir, unset = TRUE, deleteRoot = TRUE)
##D 
##D # example with external database
##D # create a connector
##D require("RPostgreSQL")
##D drv <- dbDriver("PostgreSQL")
##D connector <- function() {
##D   dbConnect(drv, dbname = "postgres",
##D             host = "localhost", port = 5432,
##D             user = "user", password = pw)
##D }
##D # Now you can create an empty repository with postgress database
##D exampleRepoDir <- tempfile()
##D createPostgresRepo( repoDir = exampleRepoDir, connector)
##D data(iris)
##D saveToLocalRepo(iris)
##D showLocalRepo()
##D showLocalRepo(method = "tags")
##D deleteLocalRepo( repoDir = exampleRepoDir, unset = TRUE, deleteRoot = TRUE)
##D 
## End(Not run)



