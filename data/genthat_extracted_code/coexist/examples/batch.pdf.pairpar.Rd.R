library(coexist)


### Name: batch.pdf.pairpar
### Title: batch analysis to plot matrix heatmaps for pairwise parameter
###   matrices for different scenarios and generate pdf graphics
### Aliases: batch.pdf.pairpar

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (parmatlist, pagesetup = c(2, 2), path = NULL) 
{
    scenarionum <- length(parmatlist)
    parnum <- length(parmatlist[[1]][[1]])
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
        filename = paste(folder, "pairwiseparameters", randnum, 
            ".pdf", sep = "")
    }
    pdf(filename)
    par(mfrow = pagesetup)
    for (each in 1:parnum) {
        for (i in 1:scenarionum) {
            xname = paste("Model", i, sep = "-")
            title = names(parmatlist[[i]][[1]])[each]
            t <- parmatlist[[i]][[1]][[each]]
            t <- t(t)
            make.heatmap(t, xname = xname, xlab = c(0.1, 0.25, 
                0.5, 0.75, 0.9), ylab = c(0.1, 0.25, 0.5, 0.75, 
                0.9), title = title)
        }
    }
    dev.off()
  }



