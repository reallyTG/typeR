library(GA)


### Name: palettes
### Title: Colors palettes
### Aliases: jet.colors spectral.colors bl2gr.colors
### Keywords: hplot

### ** Examples

jet.colors(9)
spectral.colors(9)
bl2gr.colors(9)

par(mfrow = c(3,1), mar = c(1,1,1,1))
n = 21
image(1:21, 1, as.matrix(1:21), col = jet.colors(21),
      ylab = "", xlab = "", xaxt = "n", yaxt = "n", bty = "n")
image(1:21, 1, as.matrix(1:21), col = spectral.colors(21),
      ylab = "", xlab = "", xaxt = "n", yaxt = "n", bty = "n")
image(1:21, 1, as.matrix(1:21), col = bl2gr.colors(21),
      ylab = "", xlab = "", xaxt = "n", yaxt = "n", bty = "n")



