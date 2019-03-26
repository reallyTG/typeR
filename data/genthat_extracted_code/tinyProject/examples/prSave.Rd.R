library(tinyProject)


### Name: prSave
### Title: Easily save and load data
### Aliases: prSave prLoad

### ** Examples


projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

test <- rnorm(100)
prSave(test)

list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

# Save again but add a description
prSave(test, replace = TRUE, desc = "Just a test !")

prLoad(test)

# It is also possible to save/load in subfolders
prSave(test, TRUE, subdir = "testdir", desc = "Saved in subfolder")
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

# Or equivalently
prSave("testdir/test", TRUE, desc = "Saved in subfolder")

prLoad(test, subdir="testdir")
prLoad("testdir/test")
  



