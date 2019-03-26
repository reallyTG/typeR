library(adapr)


### Name: idSync
### Title: Returns the source files needed to repair synchrony
### Aliases: idSync

### ** Examples

## Not run: 
##D projInfo <- getProjectInfo(pullSourceInfo("adaprHome")$dependency.dir)
##D trees <- readDependency(pullSourceInfo("adaprHome")$dependency.dir)
##D file.info <-condenseFileInfo(trees)
##D idSync(file.info,projInfo$graph) 
## End(Not run) 



