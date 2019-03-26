library(logmult)


### Name: anoas
### Title: Analysis of Association Functions
### Aliases: anoas anoasL
### Keywords: models nonlinear

### ** Examples

  ## Wong (2010), Table 2.6
  data(gss8590)

  # The table used in Wong (2010) is not perfectly consistent
  # with that of Wong (2001)
  tab <- margin.table(gss8590[,,c(2,4)], 1:2)
  tab[2,4] <- 49

  # Results correspond to lines 1, 6 and 11
  results <- anoas(tab, nd=2)
  results

  ## Don't show: 
      det <- summary(results)
      stopifnot(isTRUE(all.equal(det[[1]], c(12, 6, 2))))
      stopifnot(isTRUE(all.equal(round(det[[2]], 2), c(1373.18, 125.06, 0.60))))
      stopifnot(isTRUE(all.equal(round(det[[4]], 2), c(23.86, 6.44, 0.09))))
      stopifnot(isTRUE(all.equal(round(det[[5]], 2), c(1274.08, 75.51, -15.92))))
      stopifnot(isTRUE(all.equal(round(det[[7]][-1], 2), c(-1248.12, -124.46))))
      stopifnot(isTRUE(all.equal(det[[8]][-1], c(-6, -4))))
  
## End(Don't show)



