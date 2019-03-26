library(wavScalogram)


### Name: wavPlot
### Title: Wavelet plots
### Aliases: wavPlot

### ** Examples


nt <- 1500
time <- 1:nt
sd_noise <-  0.2 #% In Bolós et al. 2017 Figure 1, sd_noise = 1.
signal1 <- rnorm(n = nt, mean = 0, sd = sd_noise) + sin(time / 10)
signal2 <- rnorm(n = nt, mean = 0, sd = sd_noise) + sin(time / 10)
signal2[500:1000] = signal2[500:1000] + sin((500:1000) / 2)
## Not run: 
##D wsd <- wsd(signal1 = signal1, signal2 = signal2, mc_nrand = 10, makefigure = FALSE)
##D wavPlot(Z = -log2(wsd$wsd), X = wsd$t, Y = wsd$scales, Ylog = TRUE, coi = wsd$coi,
##D         rdist = wsd$rdist, sig95 = wsd$signif95, sig05 = wsd$signif05, Xname = "Time",
##D         Yname = "Scale", Zname = "-log2(WSD)")
## End(Not run)




