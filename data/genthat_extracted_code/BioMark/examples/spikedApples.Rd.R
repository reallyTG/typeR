library(BioMark)


### Name: spikedApples
### Title: Metabolomics data on spiked apples
### Aliases: spikedApples
### Keywords: datasets

### ** Examples

data(spikedApples)
## show features identified in all apples
plot(spikedApples$rt, spikedApples$mz,
     xlab = "Retention time (s)", ylab = "m/z",
     main = "Spiked apples - subset")



