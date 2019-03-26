library(biostat3)


### Name: muhaz2
### Title: Formula wrapper for the 'muhaz' function from the 'muhaz'
###   package.
### Aliases: muhaz2 plot.muhaz2 plot.muhazList lines.muhazList lines.muhaz2
###   summary.muhazList as.data.frame.muhaz as.data.frame.muhazList
### Keywords: survival

### ** Examples

  plot(muhaz2(Surv(surv_mm, status == "Dead: cancer")~1, melanoma))



