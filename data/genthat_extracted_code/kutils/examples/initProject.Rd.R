library(kutils)


### Name: initProject
### Title: Create project directories, initialize a git repo, create
###   README.md ChangeLog, and R template file in R directory
### Aliases: initProject

### ** Examples

projdir1 <- file.path(tempdir(), "test1")
dir.create(projdir1, recursive = TRUE)
initProject(dir = projdir1)
list.files(projdir1, all.files = TRUE)
projdir2 <- file.path(tempdir(), "test2")
dir.create(projdir2, recursive = TRUE)
## demonstrate ability to create other directories
initProject(dir = projdir2, admin = "admin", clientfiles = "client")
list.files(projdir2, all.files = TRUE)
## demonstrate ability to nullify standard directories
projdir3 <- file.path(tempdir(), "test3")
dir.create(projdir3, recursive = TRUE)
initProject(projdir3, odir = NA, tdir = NA, writedir = NA)
list.files(projdir3, all.files = TRUE)
unlink(c("projdir1", "projdir2", "projdir3"), recursive = TRUE)



