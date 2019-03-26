library(glmx)


### Name: pregibon
### Title: Pregibon Distribution
### Aliases: dpregibon ppregibon qpregibon rpregibon
### Keywords: distribution

### ** Examples

## Koenker & Yoon (2009), Figure 2
par(mfrow = c(3, 3))
pregiboncurve <- function(a, b, from, to, n = 301) {
  dp <- function(x) dpregibon(x, a = a, b = b)
  curve(dp, from = from, to = to, n = n,
    xlab = "", ylab = "",
    main = paste("a = ", a, ", b = ", b, sep = ""))
}
pregiboncurve(-0.25, -0.25,  -5, 65)
pregiboncurve(-0.25,  0,    -18, 18)
pregiboncurve(-0.25,  0.25, -65,  5)
pregiboncurve( 0,    -0.25,  -4, 22)
pregiboncurve( 0,     0,     -8,  8)
pregiboncurve( 0,     0.25, -22,  4)
pregiboncurve( 0.25, -0.25,  -2.4,9)
pregiboncurve( 0.25,  0,     -4,  4)
pregiboncurve( 0.25,  0.25,  -9,  2.4)
par(mfrow = c(1, 1))



