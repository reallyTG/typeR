library(STB)


### Name: stb.VCA
### Title: Simultaneous Tolerance Bounds on Residuals and Random Effects
###   for 'VCA' Objects.
### Aliases: stb.VCA

### ** Examples

## Not run: 
##D library(VCA)
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/run, dataEP05A2_1)
##D fit
##D 
##D # use studentized conditional residuals
##D stb.obj1 <- stb(fit, term="cond", mode="student", N=1000)
##D 
##D # plot it again
##D plot(stb.obj1)
##D 
##D # now request also plotting the corresponding residual plot
##D # capture additional computation results which are invisibly 
##D # returned
##D stb.obj1 <- plot(stb.obj1, type=3)
##D 
##D # use other type of legend in QQ-plot
##D plot(stb.obj1, stb.lpos="topleft")
##D 
##D # use random effects "day" and apply standardization
##D stb.obj2 <- stb(fit, term="day", mode="stand", N=1000)
##D # plot it again
##D plot(stb.obj2)
##D 
##D # more complex example
##D data(Orthodont)
##D Ortho <- Orthodont
##D Ortho$age2 <- Ortho$age - 11
##D Ortho$Subject <- factor(as.character(Ortho$Subject))
##D fit.Ortho <- anovaMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho)
##D 
##D # studentized conditional residuals
##D stb.cr.stud <- stb(fit.Ortho, term="cond", mode="stud", N=1000)
##D 
##D # same model fitted via REML (same covariance structure of random effects by
##D # constraining it to be diagonal)
##D fit.Ortho.reml1 <- remlMM(distance~Sex*age2+(Subject)*age2, Ortho, cov=FALSE)
##D 
##D # allow block-diagonal covariance structure of random effects due to non-zero
##D # correlation between intercept and slope of random regression part,
##D # not 'cov=TRUE' is the default
##D fit.Ortho.reml2 <- remlMM(distance~Sex*age2+(Subject)*age2, Ortho)
##D fit.Ortho.reml1
##D fit.Ortho.reml2
##D 
##D # covariance matrices of random effects 'G' differ
##D getMat(fit.Ortho.reml1, "G")[1:10, 1:10]
##D getMat(fit.Ortho.reml2, "G")[1:10, 1:10]
##D 
##D # therefore, (conditional) residuals differ
##D resid(fit.Ortho.reml1)
##D resid(fit.Ortho.reml2)
##D 
##D # therefore, STB differ
##D 
##D # studentized conditional residuals
##D system.time({
##D stb.cr.stud.reml1 <- stb(fit.Ortho.reml1, term="cond", mode="stud", 
##D                          N=5000, Ncpu=2, seed=11) })
##D system.time({
##D stb.cr.stud.reml2 <- stb(fit.Ortho.reml2, term="cond", mode="stud", 
##D                          N=5000, Ncpu=4, seed=11) })
##D 
##D # same seed-value should yield identical results
##D system.time({
##D stb.cr.stud.reml3 <- stb(fit.Ortho.reml2, term="cond", mode="stud", 
##D                          N=5000, Ncpu=4, seed=11) })
##D 
##D par(mfrow=c(1,2))
##D plot(stb.cr.stud.reml2)
##D plot(stb.cr.stud.reml3)
##D 
##D # both type of plots side-by-side
##D plot(stb.cr.stud.reml2, type=3)
##D 
##D # and enabling identification of points
##D # identified elements in the 1st plot will
##D # be automatically added to the 2nd one
##D plot(stb.cr.stud.reml2, type=3, pick=TRUE)
##D 
##D # raw "day" random effects
##D stb.re.subj <- stb(fit.Ortho, term="Subject", N=1000)
##D 
##D # identify points using the mouse
##D stb.re.subj <- plot(stb.re.subj, pick=TRUE, type=3)
##D 
##D # now click on points
## End(Not run)




