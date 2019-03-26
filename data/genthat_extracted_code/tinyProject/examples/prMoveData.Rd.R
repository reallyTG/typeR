library(tinyProject)


### Name: prMoveData
### Title: Move and delete data files.
### Aliases: prMoveData prDeleteData

### ** Examples

projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

x <- rnorm(100)

prSave(x)
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

prMoveData(x, "testdir")
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

prDeleteData("testdir/x")
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)




