library(coexist)


### Name: filename.check
### Title: open,check and create a new folder if not existed
### Aliases: filename.check

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (path = NULL, return = TRUE) 
{
    randnum <- runif(1)
    if (length(path) != 0) {
        pos <- unlist(gregexpr("/", path))
        dot <- unlist(gregexpr(".", path, fixed = T))
        dd <- unlist(gregexpr(":", path, fixed = T))
        special <- unlist(gregexpr("00yh", path))
        if (length(pos) >= 2 & dot[1] != -1 & dd[1] != -1 & special[1] != 
            -1) {
            folder <- substr(path, 1, pos[length(pos)] - 1)
            dir.create(folder, showWarnings = F)
            fname <- path
        }
        if (length(pos) >= 2 & dot[1] != -1 & dd[1] != -1 & special[1] == 
            -1) {
            folder <- substr(path, 1, pos[length(pos)] - 1)
            dir.create(folder, showWarnings = F)
            fname <- paste(substr(path, 1, dot[length(dot)] - 
                1), "00yh", substr(path, dot[length(dot)], nchar(path)), 
                sep = "")
        }
        if (dot[1] == -1 & dd[1] != -1 & special[1] == -1) {
            dir.create(path, showWarnings = F)
            fname <- paste(path, "/", randnum, "00yh", ".dat", 
                sep = "")
        }
        if (dot[1] == -1 & dd[1] == -1 & special[1] == -1) {
            path <- paste("c://", path, sep = "")
            dir.create(path, showWarnings = F)
            fname <- paste(path, "/", randnum, "00yh", ".dat", 
                sep = "")
        }
    }
    if (length(path) == 0) {
        if (length(folder) == 0) {
            folder = "c://outcome"
        }
        fname <- paste(folder, "/", randnum, "00yh", ".dat", 
            sep = "")
        dir.create(folder, showWarnings = F)
    }
    if (return == T) {
        return(fname)
    }
  }



