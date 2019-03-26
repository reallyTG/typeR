library(Rssa)


### Name: grouping.auto.pgram
### Title: Group elementary series using periodogram
### Aliases: grouping.auto.pgram grouping.auto.pgram.ssa
###   grouping.auto.pgram.toeplitz.ssa grouping.auto.pgram.1d.ssa
###   plot.grouping.auto.pgram

### ** Examples

  ss <- ssa(co2)
  plot(ss, type = "vectors", idx = 1:12)
  plot(ss, type = "vectors", vectors = "factor", idx = 1:12)
  plot(ss, type = "series", groups = 1:12)

  g1 <- grouping.auto(ss, base = "series", freq.bins = list(0.005), threshold = 0.95)
  g2 <- grouping.auto(ss, base = "eigen", freq.bins = 2, threshold = 0)
  g3 <- grouping.auto(ss, base = "factor", freq.bins = list(c(0.1), c(0.1, 0.2)), 
                      threshold = 0, method = "linear")
  g4 <- grouping.auto(ss, freq.bins = c(0.1, 0.2), threshold = 0)

  g <- grouping.auto(ss, freq.bins = 8, threshold = 0)
  plot(reconstruct(ss, groups = g))
  plot(g)

  g <- grouping.auto(ss, freq.bins = list(0.1, 0.2, 0.3, 0.4, 0.5), threshold = 0.95)
  plot(reconstruct(ss, groups = g))
  plot(g)



