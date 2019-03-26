library(highriskzone)


### Name: det_hrz
### Title: Determination of the high-risk zone.
### Aliases: det_hrz highriskzone.object highriskzone

### ** Examples

 data(craterA)
## change npixel to 1000 to obtain nicer plots
spatstat::spatstat.options(npixel=100)
## type: dist
hrzd1 <- det_hrz(craterA, type = "dist", criterion = "area", cutoff = 1000000, nxprob = 0.1)
hrzd2 <- det_hrz(craterA, type = "dist", criterion = "indirect", cutoff = 0.9, nxprob = 0.1)
hrzd3 <- det_hrz(craterA, type = "dist", criterion = "direct", cutoff = 100, nxprob = 0.1)

op <- par(mfrow = c(2, 2))
plot(craterA)
plot(hrzd1, zonecol = 2, win = craterA$window, plotwindow = TRUE)
plot(hrzd2, zonecol = 3,  win = craterA$window, plotwindow = TRUE)
plot(hrzd3, zonecol = 4,  win = craterA$window, plotwindow = TRUE)
par(op)

## Not run: 
##D # or first calculate the distancemap and use it:
##D distm <- distmap(craterA)
##D hrzd <- det_hrz(craterA, type = "dist", criterion = "direct", cutoff = 100,
##D                 distancemap = distm, nxprob = 0.1)
## End(Not run)                
## type: intens 
# reduce number of observations for faster computation
thin.craterA <- craterA[1:10]
hrzi1 <- det_hrz(thin.craterA, type = "intens", criterion = "area", cutoff = 100000, nxprob = 0.1)
plot(hrzi1)
plot(thin.craterA, add = TRUE)
plot(thin.craterA$window, add = TRUE)
## Not run: 
##D hrzi2 <- det_hrz(craterA, type = "intens", criterion = "indirect", cutoff = 0.1, nxprob = 0.1)
##D hrzi3 <- det_hrz(craterA, type = "intens", criterion = "direct", cutoff = 0.0001, nxprob = 0.1)
##D plot(hrzi2)
##D plot(hrzi3)
## End(Not run)
                 
## More detailed examples on http://highriskzone.r-forge.r-project.org/



