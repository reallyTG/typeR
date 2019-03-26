library(secr)


### Name: plot.secr
### Title: Plot Detection Functions
### Aliases: plot.secr plot.secrlist detectfnplot attenuationplot
### Keywords: hplot

### ** Examples


plot (secrdemo.b, xval = 0:100, ylim = c(0, 0.4))
## Add recapture probability
plot (secrdemo.b, newdata = data.frame(b = 1), add = TRUE,
    col = "red")

## signal strength detection: 70dB at source, attenuation
## 0.3dB/m, sdS 5dB; detection threshold 40 dB.
detectfnplot (detectfn = 10, c(70, -0.3, 5), details =
    list(cutval = 40))

## add a function with louder source and spherical spreading...
detectfnplot (detectfn = 11, c(110, -0.3, 5), details =
    list(cutval = 40), add = TRUE, col = "red")

## matching sound attenuation curves; `spherical-only' dashed line
attenuationplot (c(70, -0.3), spherical = FALSE, ylim=c(-10,110))
attenuationplot (c(110, 0), spherical = TRUE, add=TRUE, lty=2)
attenuationplot (c(110, -0.3), spherical = TRUE, add = TRUE,
    col = "red")




