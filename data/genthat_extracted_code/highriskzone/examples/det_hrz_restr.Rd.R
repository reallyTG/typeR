library(highriskzone)


### Name: det_hrz_restr
### Title: Determination of the high-risk zone.
### Aliases: det_hrz_restr

### ** Examples

set.seed(1211515)
data(craterA)
#change npixel = 100 to 1000 to get a nicer picture
spatstat::spatstat.options(npixel=100)
# reduce number of observations for faster computation
craterA <- craterA[sample(1:craterA$n, 150)]
# define restriction area
restrwin <- spatstat::owin(xrange=craterA$window$xrange, yrange=craterA$window$yrange,
                           poly=list(x=c(1500, 1500, 2000, 2000), y=c(2000, 1500, 1500, 2000)))

# create image of observation probability (30% inside restriction area)
wim <- spatstat::as.im(craterA$window, value=1)
rim <- spatstat::as.im(restrwin, xy=list(x=wim$xcol, y=wim$yrow))
rim$v[is.na(rim$v)] <- 0
oim1 <- spatstat::eval.im(wim - 0.7 * rim)
# determine high-risk zone by weighting the observations
hrzi1 <- det_hrz_restr(ppdata=craterA, type = "intens", criterion = "indirect",
                       cutoff = 0.4, hole=NULL, obsprobs=NULL, obsprobimage=oim1, nxprob = 0.1)

# determine high-risk zone by accounting for a hole
hrzi2 <- det_hrz_restr(ppdata=craterA, type = "intens", criterion = "indirect",
                       cutoff = 0.4, hole=restrwin, obsprobs=NULL, obsprobimage=NULL, nxprob = 0.1)



