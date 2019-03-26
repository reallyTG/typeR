library(simba)


### Name: bb2num
### Title: Transform Braun-Blanquet scale data to percentage cover values
###   and vice versa
### Aliases: bb2num
### Keywords: manip utilities

### ** Examples

## Create a species that occurs on 7 plots
## with all the different possibilities of
## the BB scale
spec <- c("r", "+", "0", "1", "2", "3", "4", "5")

## Create a highly artificial species matrix.
## All species are the same for simplicity 
dat.bb <- data.frame(spec, spec, spec, spec, spec, spec)

## Transform from BB scale to percentage values
dat.proc <- bb2num(dat.bb)

## When transforming back the class definitions are a little
## more complicated. Just give the lower and upper limits for
## each class in the from vector class for class.
from <- c(0, 0.1, 0.1, 2, 2, 5, 5, 25, 25, 50, 50, 75, 75, 100)
to <- c("r", "+", "1", "2", "3", "4", "5")
bb2num(dat.proc, from=from, to=to)




