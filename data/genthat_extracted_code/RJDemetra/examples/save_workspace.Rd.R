library(RJDemetra)


### Name: save_workspace
### Title: Save a workspace
### Aliases: save_workspace

### ** Examples

## No test: 
dir <- tempdir()
# Create and export a empty 'JDemetra+' workspace
wk <- new_workspace()
new_multiprocessing(wk, "sa1")
save_workspace(wk, file.path(dir, "workspace.xml"))
## End(No test)




