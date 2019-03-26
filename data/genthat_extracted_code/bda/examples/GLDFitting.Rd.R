library(bda)


### Name: fit.GLD.FMKL
### Title: Fitting FMKL GLD
### Aliases: fit.GLD.FMKL fit.GLD print.FMKL plot.FMKL lines.FMKL
### Keywords: distribution stats

### ** Examples

  data(hhi)
  hmob <- binning(counts=hhi$mob, breaks=hhi$breaks)
  lmd5 <- fit.GLD.FMKL(hmob)
  lmd6 <-  fit.GLD.FMKL(hmob, mle=TRUE)
  plot(lmd5)
  lines(lmd6, col=4)
  ## GOP example (handbook) -- Hahn & Sapiro (1967)
  ## KS-GLD based on original data: (0.0345, 0.00009604, 0.87, 4.92)
  ## Table 3.6-1
  breaks <- c(-Inf, seq(0.015, length=10, by=0.005), Inf)
  counts <- c(1,9,30,44,58,45,29,17,9,4,4)
  rho.mid <- c(0.0325, 0.0250, 0.667, 0.600)
  rho.unif <- c(0.03352, 0.02531, 0.7786, 0.5009)
  ## histogram for chi-square test
  ## KS = 0.0225, p-value = 0.999.  Chi=0.5176, p-value=0.7720
  breaks <- c(-Inf, 0.025, 0.03, 0.035, 0.04, 0.045, 0.05, Inf)
  counts <- c(40,44,58,45, 29,17,17)





