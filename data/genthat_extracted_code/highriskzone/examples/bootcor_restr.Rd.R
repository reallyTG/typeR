library(highriskzone)


### Name: bootcor_restr
### Title: Bootstrap correction to obtain desired failure probability
### Aliases: bootcor_restr

### ** Examples

data(craterA)
set.seed(4321)
# define restriction area
restrwin <- spatstat::owin(xrange = craterA$window$xrange, 
                          yrange = craterA$window$yrange,
                          poly = list(x = c(1500, 1500, 2000, 2000), 
                                      y = c(2000, 1500, 1500, 2000)))

# create image of observation probability (30% inside restriction area)
wim <- spatstat::as.im(craterA$window, value = 1)
rim <- spatstat::as.im(restrwin, xy = list(x = wim$xcol, y = wim$yrow))
rim$v[is.na(rim$v)] <- 0
oim1 <- spatstat::eval.im(wim - 0.7 * rim)

## Not run: 
##D # perform bootstrap correction
##D bc1 <- bootcor_restr(ppdata=craterA, cutoff=0.4, numit=100, tol=0.02, obsprobimage=oim1, nxprob=0.1)
##D bc1
##D summary(bc1)
##D plot(bc1)
##D 
##D # determine high-risk zone by weighting the observations
##D hrzi1 <- det_hrz_restr(ppdata=craterA, type = "intens", criterion = "indirect",
##D  cutoff = bc1$alphastar, hole=NULL, obsprobs=NULL, obsprobimage=oim1, nxprob = 0.1)
##D 
##D # perform bootstrap correction
##D set.seed(4321)
##D bc2 <- bootcor_restr(ppdata=craterA, cutoff=0.4, numit=100, tol=0.02, hole=restrwin, nxprob=0.1)
##D bc2
##D summary(bc2)
##D plot(bc2)
##D 
##D # determine high-risk zone by accounting for a hole
##D hrzi2 <- det_hrz_restr(ppdata=craterA, type = "intens", criterion = "indirect",
##D  cutoff = bc2$alphastar, hole=restrwin, obsprobs=NULL, obsprobimage=NULL, nxprob = 0.1)
## End(Not run)



