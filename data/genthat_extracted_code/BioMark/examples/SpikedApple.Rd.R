library(BioMark)


### Name: SpikedApple
### Title: Spike-in metabolomics data for apple extracts
### Aliases: SpikedApple SpikeNeg SpikePos neg.markers pos.markers
### Keywords: datasets

### ** Examples

data(SpikePos)
plot(SpikePos$annotation[,c("rt", "mz")],
     xlab = "Time (s)", ylab = "m/z",
     main = "Positive ionization mode")
points(pos.markers[!is.na(pos.markers$feature.nr), c("rt", "mz")],
       pch = 19, col = 2)

data(SpikeNeg)
plot(SpikeNeg$annotation[,c("rt", "mz")],
     xlab = "Time (s)", ylab = "m/z",
     main = "Negative ionization mode")
points(neg.markers[!is.na(neg.markers$feature.nr), c("rt", "mz")],
       pch = 19, col = 2)



