library(AGSDest)


### Name: seqconfint
### Title: Calculates confidence interval
### Aliases: seqconfint
### Keywords: methods

### ** Examples

##The following calculates the repeated confidence bound of a group sequential trial

GSD <- plan.GST(K=4, SF=1, phi=0, alpha=0.025, delta=6, pow=0.8,
                compute.alab=TRUE, compute.als=TRUE)

GST <- as.GST(GSD=GSD, GSDo=list(T=2, z=3.1))
seqconfint(GST, type="r")

##The confidence bound based on the stage-wise ordering of a group sequential trial is calculated by

seqconfint(GST, type="so")

##The repeated confidence interval at the earlier stage T=1 where the
##trial stopping rule is not met.

seqconfint(as.GST(GSD, GSDo=list(T=1, z=0.7)), type="r")

##The repeated confidence bound and the confidence bound
##based on the stage-wise ordering of a group sequential trial
##after a design adaptation is calculated by

pT <- plan.GST(K=3, SF=4, phi=-4, alpha=0.05, delta=6, pow=0.9,
               compute.alab=TRUE, compute.als=TRUE)

iD <- list(T=1, z=1.090728)

swImax <- 0.0625

I2min <- 3*swImax
I2max <- 3*swImax

sT <- adapt(pT=pT, iD=iD, SF=1, phi=0, cp=0.8, theta=5, I2min, I2max, swImax)

sTo <- list(T=2, z=2.393)

AGST <- as.AGST(pT=pT, iD=iD, sT=sT, sTo=sTo)
seqconfint(AGST)

##The repeated confidence interval at the earlier stage T=2 where the
##trial stopping rule is not met.

seqconfint(as.AGST(pT, iD, sT, sTo=list(T=2, z=1.7)), type="r")

## Not run: 
##D   ##If the stage-wise adjusted confidence interval is calculated at this stage,
##D   ##the function returns an error message
##D 
##D   seqconfint(as.AGST(pT, iD, sT, sTo=list(T=2, z=1.7)), type="so")
## End(Not run)



