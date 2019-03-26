library(coexist)


### Name: make.heatmap
### Title: make a heatmap based on matrix values
### Aliases: make.heatmap

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (mat, type = "gray", xname = "x", yname = "y", xlab = NULL, 
    ylab = NULL, title = NULL) 
{
    xrange <- dim(mat)[2] + 1
    yrange <- dim(mat)[1] + 1
    if (xrange >= yrange) {
        maxrange <- xrange
        xscale = 1
        yscale <- yrange/xrange
    }
    if (yrange > xrange) {
        maxrange <- yrange
        xscale <- xrange/yrange
        yscale = 1
    }
    maxnum = ceiling(max(as.vector(mat)))
    tmat <- t(mat)
    plot((1:maxrange) * xscale, (1:maxrange) * yscale, type = "n", 
        xlab = xname, ylab = yname, axes = F)
    if (length(xlab) != 0) {
        axis(1, at = c(1:(xrange - 1)) + 0.5, labels = xlab)
    }
    else {
        axis(1, at = c(1:(xrange - 1)) + 0.5, labels = c(1:(xrange - 
            1)))
    }
    if (length(ylab) != 0) {
        axis(2, at = c(1:(yrange - 1)) + 0.5, labels = ylab)
    }
    else {
        axis(2, at = c(1:(yrange - 1)) + 0.5, labels = c(1:(yrange - 
            1)))
    }
    if (length(title) != 0) {
        mtext(title)
    }
    for (i in 1:(xrange - 1)) {
        for (j in 1:(yrange - 1)) {
            value = tmat[i, j]
            x1 = i
            x2 = i + 1
            y1 = j
            y2 = j + 1
            if (type == "gray") {
                rect(x1, y1, x2, y2, col = gray((maxnum - value)/maxnum), 
                  border = gray((maxnum - value)/maxnum))
            }
        }
    }
  }



