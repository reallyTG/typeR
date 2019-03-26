library(warbleR)


### Name: frange.detec
### Title: Detect frequency range on wave objects
### Aliases: frange.detec

### ** Examples

{
data(tico)
frange.detec(wave = tico, wl = 512, fsmooth = 0.01, threshold = 1, bp = c(2, 8),
 widths = c(4, 2))

data(sheep)
frange.detec(wave = sheep, wl = 512, fsmooth = 0.2, threshold = 50, bp = c(0.3, 1), 
flim = c(0, 1.5), pal = reverse.heat.colors, main = "sheep")
}




