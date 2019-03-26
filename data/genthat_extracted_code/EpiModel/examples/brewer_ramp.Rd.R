library(EpiModel)


### Name: brewer_ramp
### Title: RColorBrewer Color Ramp for EpiModel Plots
### Aliases: brewer_ramp
### Keywords: colorUtils internal

### ** Examples

# Shows a 100-color ramp for 4 RColorBrewer palettes
par(mfrow = c(2, 2), mar=c(1, 1, 2, 1))
pals <- c("Spectral", "Greys", "Blues", "Set1")
for (i in seq_along(pals)) {
 plot(1:100, 1:100, type = "n", axes = FALSE, main = pals[i])
 abline(v = 1:100, lwd = 6, col = brewer_ramp(100, pals[i]))
}




