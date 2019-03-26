library(TropFishR)


### Name: plot.lfq
### Title: Plotting of length frequency data (with VBGF curves)
### Aliases: plot.lfq

### ** Examples

data(alba)
res <- lfqRestructure(alba)

# simple plot or reconstructed frequencies
plot(x = res, Fname = "rcounts")

# add VBGF curves
plot(res, Fname = "rcounts", par = list(Linf = 14, K = 1.1, t_anchor = 0.3))

# add soVBGF curves, adjust hist.sc and xlim
plot(res, Fname = "catch", curve.col=4,
  par = list(Linf = 14, K = 1.1, t_anchor = 0.3, C = 0.2, ts = 0.75),
  hist.sc = 0.9,
  xlim=range(res$dates)+c(-30, 0)
)

# adjust image colors
plot(res, Fname = "rcounts", image.col = NA )
plot(res, Fname = "rcounts", image.col = rev(cm.colors(21)) )
plot(res, Fname = "rcounts", image.col = colorRampPalette(c("red","grey90","green"))(21))

# solid plot region color
plot(res, xlim=range(res$dates)+c(-60, 60),
  hist.sc=0.75, image.col="grey90") # leaves gaps
plot(res, xlim=range(res$dates)+c(-60, 60),
  hist.sc=0.75, region.col="grey90") # full coverage

# low-level plot additions
plot(res)
abline(h=4, lty=2)
mtext("Restructured frequencies (MA=5)", line=0.25, side=3)






