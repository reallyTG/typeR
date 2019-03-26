library(StratigrapheR)


### Name: nlegend
### Title: New legend element
### Aliases: nlegend

### ** Examples

opar <- par("mar")

par(mar = c(0,0,0,0))

layout(matrix(1:6, 6, 1, byrow = TRUE))

nlegend(t = paste("Shaded stuff. By the way you can\nwrite",
                  "text in several lines if needed"))

rect(-1,-1,1,1, density = 10)

nlegend(TRUE, t = "Text: left side at x = 1.3 (default xt value)")

par(mar = opar)




