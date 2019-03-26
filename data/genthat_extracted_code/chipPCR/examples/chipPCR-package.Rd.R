library(chipPCR)


### Name: chipPCR-package
### Title: Toolkit of functions to pre-process amplification data
### Aliases: chipPCR-package chipPCR
### Keywords: chipPCR

### ** Examples

# Example: A simple function to test for a background range.
# Data were taken form the chipPCR C17 data set.
data(C17)
plot(C17[, 2], C17[,  3], xlab = "time [min]", ylab = "Fluorescence", 
      pch = 20)
res <- bg.max(C17[, 2], C17[, 3], bg.corr = 1.4, bg.start = 3)
abline(v = c(slot(res, "bg.start"), slot(res, "bg.stop")), col = c(1,2))
abline(h = slot(res, "fluo"), col = "blue")



