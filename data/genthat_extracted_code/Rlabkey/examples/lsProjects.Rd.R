library(Rlabkey)


### Name: lsProjects
### Title: List the projects available at a given LabKey Server address
### Aliases: lsProjects
### Keywords: file

### ** Examples


## get list of projects on server, connect a session in one project,
## then list the folders in that project
# library(Rlabkey)

lsProjects("http://www.labkey.org")

lkorg <- getSession("http://www.labkey.org", "/home")
lsFolders(lkorg)

## Not run: 
##D 
##D lkorg <- getSession("http://www.labkey.org", "/home/Study/ListDemo")
##D lsSchemas(lkorg)
##D 
## End(Not run)



