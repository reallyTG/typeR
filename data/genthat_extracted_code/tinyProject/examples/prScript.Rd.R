library(tinyProject)


### Name: prScript
### Title: create and/or open R scripts
### Aliases: prScript

### ** Examples

projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

prScript("test")
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

prScript("myFunction", template = "function")

# Create script in a subfolder
prScript("test", subdir = "testdir")

# Or equivalently
prScript("testdir/test")




