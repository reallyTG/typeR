library(hyperSpec)


### Name: spc.rubberband
### Title: Rubberband baseline correction
### Aliases: spc.rubberband

### ** Examples

plot (paracetamol [,, 175 ~ 1800])
bl <- spc.rubberband (paracetamol [,, 175 ~ 1800], noise = 300, df = 20)
plot (bl, add = TRUE, col = 2)

plot (paracetamol [,, 175 ~ 1800] - bl)



