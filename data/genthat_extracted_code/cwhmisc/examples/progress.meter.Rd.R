library(cwhmisc)


### Name: progress.meter
### Title: Monitor the progress of a repetitive calculation.
### Aliases: progress.meter
### Keywords: print

### ** Examples

  n <- 1 # adjust
  for (i in 0:250) {
    kk <- 0
    for (mm in 1:10^n) {
      kk <- kk+1  # do something time consuming
    }
    progress.meter(i)
  }
  cat("")
#    0....+....1....+....2....+....3....+....4....+....
#   50....+....6....+....7....+....8....+....9....+....



