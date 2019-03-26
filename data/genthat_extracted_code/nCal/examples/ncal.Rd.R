library(nCal)


### Name: ncal
### Title: Main function for the nCal package
### Aliases: nCal ncal rumi ncal.formula ncal.character ncalGUI
### Keywords: distribution

### ** Examples


#begin=Sys.time()

# basic example

# simulate a dataset
set.seed(1)
log.conc=log(1e4)-log(3)*9:0
n.replicate=2
fi=simulate1curve (p.eotaxin[1,], rep(log.conc,each=n.replicate), sd.e=0.2)
dat.std=data.frame(fi, expected_conc=exp(rep(log.conc,each=n.replicate)), analyte="Test", 
    assay_id="Run 1", sample_id=NA, well_role="Standard", dilution=rep(3**(9:0), each=n.replicate),
    replicate=rep(1:n.replicate, 10))
# add unknown
dat.unk=rbind(
      data.frame(fi=exp(6.75), expected_conc=NA, analyte="Test", assay_id="Run 1", sample_id=1, 
        well_role="Unknown", dilution=1, replicate=1)
    , data.frame(fi=exp(6.70), expected_conc=NA, analyte="Test", assay_id="Run 1", sample_id=2, 
        well_role="Unknown", dilution=1, replicate=1)
    , data.frame(fi=exp(3), expected_conc=NA, analyte="Test", assay_id="Run 1", sample_id=3, 
        well_role="Unknown", dilution=1, replicate=1)
    , data.frame(fi=exp(4.4), expected_conc=NA, analyte="Test", assay_id="Run 1", sample_id=4, 
        well_role="Unknown", dilution=10, replicate=1)
)
dat=rbind(dat.std, dat.unk)


## Not run: 
##D # to save some time
##D 
##D 
##D # does drm fit
##D out = ncal(log(fi)~expected_conc, dat, return.fits = TRUE, plot.se.profile=TRUE) 
##D fit=attr(out, "fits")[[1]]
##D 
##D # does jags fit and collect 1e5 posterior samples, it may be better to set n.iter higher
##D out.norm = ncal(log(fi)~expected_conc, dat, bcrm.fit=TRUE, bcrm.model="norm",
##D     return.fits = TRUE, plot.se.profile=TRUE,
##D     control.jags=list(n.iter=1e4), verbose=FALSE)
##D fit.norm=attr(out.norm, "fits")
##D 
##D # compare drm fit with bcrm fit
##D rbind(out, out.norm)
##D rbind(cla2gh(coef(fit)), coef(fit.norm))
##D rbind(sqrt(diag(vcov(fit))), sqrt(diag(vcov(fit.norm, type="classical"))) )
##D sd.est = c(summary(fit)$rseMat[1], getVarComponent.bcrm(fit.norm)^.5)
##D sd.est
##D 
##D 
##D 
##D # do ncal with imported data from a raw Luminex output file
##D # the importing step can step a litte time
##D out = ncal (paste(system.file(package="nCal")[1],'/misc/02-14A22-IgA-Biotin-tiny.xls',sep=""), 
##D     is.luminex.xls=TRUE, formula=log(fi)~expected_conc, bcrm.fit=FALSE, return.fits=TRUE)
##D fit=attr(out, "fits")[[1]]
##D getConc(fit, c(5,6))
##D 
## End(Not run)

#end=Sys.time();print(end-begin)





