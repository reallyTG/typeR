library(muma)


### Name: work.dir
### Title: Create a working directory
### Aliases: work.dir
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (dir.name) 
{
    WorkinDir = paste(getwd(), "/", dir.name, "/", sep = "")
    dir.create(WorkinDir)
    file = list.files()
    file.copy(file, WorkinDir)
    setwd(WorkinDir)
    unlink("muma.R")
  }



