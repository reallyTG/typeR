library(nCal)


### Name: drm.fit
### Title: Fit drm
### Aliases: drm.fit getVarComponent.drc
### Keywords: distribution

### ** Examples


# simulate a dataset
set.seed(1)
log.conc=log(1e4)-log(3)*9:0
n.replicate=2
fi=simulate1curve (p.eotaxin[1,], rep(log.conc,each=n.replicate), sd.e=0.2)
dat.std=data.frame(fi, expected_conc=exp(rep(log.conc,each=n.replicate)), analyte="Test", 
    assay_id="Run 1", sample_id=NA, well_role="Standard", dilution=rep(3**(9:0), each=n.replicate),
    replicate=rep(1:n.replicate, 10))

fit = drm.fit(log(fi) ~ expected_conc, dat = dat.std)
plot(fit, log="xy")
fit




