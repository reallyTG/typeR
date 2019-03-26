library(chipPCR)


### Name: VIMCFX96_69
### Title: Amplification Reaction Using the Bio-Rad CFX96
### Aliases: VIMCFX96_69
### Keywords: datasets CFX96 Elongation

### ** Examples

data(VIMCFX96_60)
data(VIMCFX96_69)

T60 <- rowMeans(VIMCFX96_60[, 2:ncol(VIMCFX96_60)])
T69 <- rowMeans(VIMCFX96_69[, 2:ncol(VIMCFX96_69)])

plot(1:length(T60), T60, main = "Fluorescence at different 
      temperatures\nQuantification in CFX96 (Bio-Rad)", xlab = "Cycle", 
      ylab = "Cycle dependent fluorescence", pch = 15, type = "b")
lines(1:length(T69), T69, pch = 19, type = "b", col = 2)
legend(1, 4500, c("Annealing (60 deg C)", "Elongation (69 deg C)"), 
	pch = c(15, 19), col = c(1,2))



