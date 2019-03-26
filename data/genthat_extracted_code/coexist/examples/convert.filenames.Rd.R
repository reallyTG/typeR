library(coexist)


### Name: convert.filenames
### Title: convert saved data sets' names in to a vector based on the order
###   of numbers, which will be called by batch.read() function
### Aliases: convert.filenames
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (folder) 
{
    files <- list.files(path = folder, full.names = TRUE)
    newf <- vector()
    fnum <- length(files)
    length(newf) <- fnum
    dataorder <- rep(0, 1, fnum)
    for (i in 1:fnum) {
        pos.end <- unlist(gregexpr("00yh", files[i]))[1] - 1
        pos.start <- unlist(gregexpr(paste(folder, "/out", sep = ""), 
            files[i]))[1] + 15
        dataorder[i] <- as.numeric(substr(files[i], pos.start, 
            pos.end))
    }
    for (i in 1:fnum) {
        newf[dataorder[i]] <- files[i]
    }
    newf <- newf[!is.na(newf)]
    return(newf)
  }



