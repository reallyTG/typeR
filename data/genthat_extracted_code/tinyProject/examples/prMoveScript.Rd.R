library(tinyProject)


### Name: prMoveScript
### Title: Move, rename and delete scripts
### Aliases: prMoveScript prRenameScript prDeleteScript

### ** Examples

projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

prScript("test")

prMoveScript("test", "testdir")

prRenameScript("testdir/test", "myTest")

prDeleteScript("testdir/myTest")





