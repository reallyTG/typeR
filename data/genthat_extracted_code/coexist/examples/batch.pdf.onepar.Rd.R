library(coexist)


### Name: batch.pdf.onepar
### Title: batch mode to plot matrix heatmap graphics for different model
###   scenarios but only working on the sampling points of one parameter
###   (x-axis) and generate pdf graphics
### Aliases: batch.pdf.onepar

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (parmatlist, pagesetup = c(2, 2), path = NULL) 
{
    scenarionum <- length(parmatlist)
    parnum <- length(parmatlist[[1]])
    if (length(path) != 0) {
        randnum <- runif(1)
        pos <- unlist(gregexpr("/", path))
        folder <- substr(path, 1, pos[length(pos)] - 1)
        dir.create(folder, showWarnings = F)
        filename = paste(path, "00yh", randnum, ".pdf", sep = "")
    }
    else {
        randnum <- runif(1)
        dir.create(folder, showWarnings = F)
        filename = paste(folder, "singleparameter", randnum, 
            ".pdf", sep = "")
    }
    pdf(filename)
    par(mfrow = pagesetup)
    for (each in 1:parnum) {
        for (i in 1:scenarionum) {
            xname = paste("Model", i, sep = "-")
            title = names(parmatlist[[i]])[each]
            t <- parmatlist[[i]][[each]]
            t <- t[order(t[, 1], decreasing = F), ]
            t <- t[-1, -1]
            make.heatmap(t, xname = xname, xlab = c(0.1, 0.25, 
                0.5, 0.75, 0.9), ylab = c(1:9), title = title)
        }
    }
    dev.off()
  }



