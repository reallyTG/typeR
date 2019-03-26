library(tinyProject)


### Name: prSource
### Title: Source a R script
### Aliases: prSource

### ** Examples

projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

prScript("helloWorld")

# Edit the script so that it does something cool

prSource("helloWorld")

# Source a file in a subdirectory
prScript("myScript", subdir = "testdir")
prSource("myScript", subdir = "testdir")

# Or equivalently
prSource("testdir/myScript")




