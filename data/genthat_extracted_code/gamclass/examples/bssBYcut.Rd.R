library(gamclass)


### Name: bssBYcut
### Title: Between group SS for 'y', for all possible splits on values of
###   'x'
### Aliases: bssBYcut
### Keywords: manip

### ** Examples

xy <- bssBYcut(weight, height, women)
with(xy, xy[which.max(bss), ])

## The function is currently defined as
function (x, y, data)
{
    xnam <- deparse(substitute(x))
    ynam <- deparse(substitute(y))
    xv <- data[, xnam]
    yv <- data[, ynam]
    sumss <- function(x, y, cut) {
        av <- mean(y)
        left <- x < cut
        sum(left) * (mean(y[left]) - av)^2 + sum(!left) * (mean(y[!left]) -
            av)^2
    }
    xOrd <- unique(sort(xv))[-1]
    bss <- numeric(length(xOrd))
    for (i in 1:length(xOrd)) {
        bss[i] <- sumss(xv, yv, xOrd[i])
    }
    list(xOrd = xOrd, bss = bss)
  }



