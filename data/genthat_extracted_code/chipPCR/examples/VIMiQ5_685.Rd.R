library(chipPCR)


### Name: VIMiQ5_685
### Title: Amplification Reaction Using the Bio-Rad iQ5
### Aliases: VIMiQ5_685
### Keywords: datasets iQ5 Elongation

### ** Examples

T595 <- rowMeans(VIMiQ5_595[, 2:ncol(VIMiQ5_595)])
T685 <- rowMeans(VIMiQ5_685[, 2:ncol(VIMiQ5_685)])

plot(1:length(T595), T595, main = "Fluorescence at different 
      temperatures\nQuantification in iQ5 (Bio-Rad)", xlab = "Cycle", 
      ylab = "Cycle dependent fluorescence", pch = 15, type = "b")
lines(1:length(T685), T685, pch = 19, type = "b", col = 2)
legend(1, 10000, c("Annealing (59.5 deg C)", "Elongation (68.5 deg C)"), 
      pch = c(15, 19), col = c(1,2))



