library(tth)


### Name: tth
### Title: R Interface to the tth/ttm TeX to HTML Converter
### Aliases: tth ttm tth.control
### Keywords: utilities

### ** Examples

tex <- c("This is \\textbf{bold} and this \\textit{italic}.",
  "Points on the unit circle: $x^2 + y^2 = 1$.")
tth(tex)
ttm(tex)

h0 <- "$H_0: \\mu_0 = 0$"
tth(h0)
tth(h0, mode = "hex")
tth(h0, mode = "named")
ttm(h0)
ttm(h0, mode = "hex")
ttm(h0, mode = "dec")



