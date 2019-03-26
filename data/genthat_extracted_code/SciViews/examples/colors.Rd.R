library(SciViews)


### Name: colors
### Title: Various color palettes.
### Aliases: colors rwb_colors rwb.colors rwg_colors rwg.colors ryg_colors
###   ryg.colors cwm_colors cwm.colors
### Keywords: color

### ** Examples

# Draw color wheels with various palettes
opar <- par(mfrow = c(2, 2))
pie(rep(1, 11), col = cwm.colors(11), main = "Cyan - white - magenta")
pie(rep(1, 11), col = rwb.colors(11), main = "Red - white - blue")
pie(rep(1, 11), col = rwg.colors(11), main = "Red - white - green")
pie(rep(1, 11), col = ryg.colors(11), main = "Red - yellow - green")
par(opar)



