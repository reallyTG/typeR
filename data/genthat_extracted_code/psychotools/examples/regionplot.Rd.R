library(psychotools)


### Name: regionplot
### Title: Region Plots for IRT Models
### Aliases: regionplot
### Keywords: aplot

### ** Examples

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit a Partial credit model to the items of the first other-to-blame
## situation: "A bus fails to stop for me"
pcm <- pcmodel(VerbalAggression$resp[, 1:6])

## a region plot with modus as cutpoint and custom labels
lab <- paste(rep(c("Curse", "Scold", "Shout"), each = 2),
  rep(c("Want", "Do"), 3 ), sep = "-")
plot(pcm, type = "regions", names = lab)

## compare the cutpoints (with ylim specified manually)
opar <- par(no.readonly = TRUE)
ylim <- c(-2, 2)
layout(matrix(1:3, ncol = 1))
plot(pcm, type = "regions", parg = list(type = "mode"),
  main = "Modus as Cutpoint", ylim = ylim) 
plot(pcm, type = "regions", parg = list(type = "median"),
  main = "Median as Cutpoint", ylim = ylim)
plot(pcm, type = "regions", parg = list(type = "mean"),
  main = "Mean as Cutpoint", ylim = ylim)
par(opar)

## PCM for full verbal aggression data set
pcm_va <- pcmodel(VerbalAggression$resp)
plot(pcm_va, type = "regions")

if(requireNamespace("mirt")) {
## generalized partial credit model for full verbal aggression data set
gpcm_va <- gpcmodel(VerbalAggression$resp)
plot(gpcm_va, type = "regions")
}



