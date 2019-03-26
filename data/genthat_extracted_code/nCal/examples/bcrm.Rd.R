library(nCal)


### Name: bcrm
### Title: Bayesian Concentration-Response Model
### Aliases: bcrm getVarComponent.bcrm vcov.bcrm coef.bcrm plot.bcrm
###   print.bcrm get.single.fit
### Keywords: distribution

### ** Examples



set.seed(1)
log.conc=log(1e4)-log(3)*9:0
n.replicate=2
fi=simulate1curve (p.eotaxin[1,], rep(log.conc,each=n.replicate), sd.e=0.3)
dat.std=data.frame(fi, expected_conc=exp(rep(log.conc,each=n.replicate)), analyte="test", 
    assay_id="assay1", sample_id=NA, well_role="Standard", dilution=rep(3**(9:0), each=n.replicate))
# add unknown
dat.unk=rbind(
      data.frame(fi=exp(6.75), expected_conc=NA, analyte="test", assay_id="assay1", 
        sample_id=1, well_role="Unknown", dilution=1)
    , data.frame(fi=exp(6.70), expected_conc=NA, analyte="test", assay_id="assay1", 
        sample_id=2, well_role="Unknown", dilution=1)
    , data.frame(fi=exp(3), expected_conc=NA, analyte="test", assay_id="assay1", 
        sample_id=3, well_role="Unknown", dilution=1)
    , data.frame(fi=exp(4.4), expected_conc=NA, analyte="test", assay_id="assay1", 
        sample_id=4, well_role="Unknown", dilution=10)
)
dat=rbind(dat.std, dat.unk)
# second plate
fi=simulate1curve (p.eotaxin[2,], rep(log.conc,each=n.replicate), sd.e=0.3)
dat.std=data.frame(fi, expected_conc=exp(rep(log.conc,each=n.replicate)), analyte="test", 
   assay_id="assay2", sample_id=NA, well_role="Standard", dilution=rep(3**(9:0), each=n.replicate))
# add unknown
dat.unk=rbind(
      data.frame(fi=exp(6.75), expected_conc=NA, analyte="test", assay_id="assay2", 
        sample_id=1, well_role="Unknown", dilution=1)
    , data.frame(fi=exp(6.70), expected_conc=NA, analyte="test", assay_id="assay2", 
        sample_id=2, well_role="Unknown", dilution=1)
    , data.frame(fi=exp(3), expected_conc=NA, analyte="test", assay_id="assay2", 
        sample_id=3, well_role="Unknown", dilution=1)
    , data.frame(fi=exp(4.4), expected_conc=NA, analyte="test", assay_id="assay2", 
        sample_id=4, well_role="Unknown", dilution=10)
)
dat=rbind(dat, dat.std, dat.unk)

fits = bcrm(log(fi)~expected_conc, dat, parameterization="gh", error.model="norm", 
    prior="cytokine", n.iter=6e3)
par(mfrow=c(1,2))
plot(fits)


## Not run: 
##D # takes longer
##D 
##D # Example from Fong et al. (2012) 
##D fits.t4 = bcrm (log(fi)~expected_conc, dat.QIL3, parameterization="gh", error.model="t4", 
##D     prior="cytokine")
##D par(mfrow=c(2,3))
##D plot(fits.t4)
##D 
##D fits.norm = bcrm (log(fi)~expected_conc, dat.QIL3, parameterization="gh", error.model="norm",
##D     prior="cytokine")
##D par(mfrow=c(2,3))
##D plot(fits.norm)
##D 
##D 
##D     
## End(Not run)




