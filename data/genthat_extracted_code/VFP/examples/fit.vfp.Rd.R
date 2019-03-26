library(VFP)


### Name: fit.vfp
### Title: Estimate (Im)Precision-Profiles Modeling the Relationship 'Var ~
###   Mean'.
### Aliases: fit.vfp

### ** Examples

## No test: 
# load VCA-package and data
library(VCA)
data(VCAdata1)
# perform VCA-anaylsis
lst <- anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample")
# transform list of VCA-objects into required matrix
mat <- getMat.VCA(lst)		# automatically selects "total"
mat

# fit all 9 models batch-wise
res <- fit.vfp(model.no=1:10, Data=mat)

# if 'mat' is not required for later usage, following works
# equally well
res2 <- fit.vfp(lst, 1:10)

# plot best-fitting model
plot(res)
plot(res, type="cv")
plot(res, type="cv", ci.type="lines", ci.col="red",
		Grid=list(col="wheat"), Points=list(pch=2, lwd=2, col="black"))

# now derive concentation at which a specific reproducibility-
# imprecision of 10% is reached and add this to the plot
pred <- plot(res, type="cv", ci.type="band", 
				ci.col=as.rgb("red", .25), Grid=list(col="orange"), 
				Points=list(pch=2, lwd=2, col="black"),
				Prediction=list(y=10, col="red"), Pred.CI=TRUE)

# (invisibly) returned object contains all relevant information
pred

# same for repeatability
mat.err <- getMat.VCA(lst, "error")
res.err <- fit.vfp(1:10, Data=mat.err)

# without extracting 'mat.err'
res.err2 <- fit.vfp(lst, 1:10, vc="error")

plot(res.err)

#######################################################################
# another example using CA19_9 data from CLSI EP05-A3

data(CA19_9)

# fit reproducibility model to data
fits.CA19_9 <- anovaVCA(result~site/day, CA19_9, by="sample")

# fit within-laboratory-model treating site as fixed effect
fits.ip.CA19_9 <- anovaMM(result~site/(day), CA19_9, by="sample")

# the variability "between-site" is not part of "total"
fits.ip.CA19_9[[1]]
fits.CA19_9[[1]]

# extract repeatability
rep.CA19_9 <- getMat.VCA(fits.CA19_9, "error")

# extract reproducibility
repro.CA19_9 <- getMat.VCA(fits.CA19_9, "total")

# extract intermediate-precision (within-lab)
ip.CA19_9 <- getMat.VCA(fits.ip.CA19_9, "total")

# fit model (a+bX)^C (model 8) to all three matrices

mod8.repro 	<- fit.vfp(repro.CA19_9, 8)
mod8.ip		<- fit.vfp(ip.CA19_9, 8)
mod8.rep		<- fit.vfp(rep.CA19_9, 8)

# plot reproducibility precision profile first
# leave enough space in right margin for a legend
plot(mod8.repro, mar=c(5.1, 7, 4.1, 15), 
		type="cv", ci.type="none", Model=FALSE,
		Line=list(col="blue", lwd=3), 
		Points=list(pch=15, col="blue", cex=1.5),  
		xlim=c(10, 450), ylim=c(0,10),
		Xlabel=list(text="CA19-9, kU/L (LogScale) - 3 Patient Pools, 3 QC Materials",
				cex=1.5), Title=NULL,
		Ylabel=list(text="% CV", cex=1.5),
		Grid=NULL, Crit=NULL, log="x")

# add intermediate precision profile
plot	(mod8.ip, type="cv", add=TRUE, ci.type="none",
		Points=list(pch=16, col="deepskyblue", cex=1.5),
		Line=list(col="deepskyblue", lwd=3), log="x")

# add repeatability precision profile
plot(	mod8.rep, type="cv", add=TRUE, ci.type="none",
		Points=list(pch=17, col="darkorchid3", cex=1.5),
		Line=list(col="darkorchid3", lwd=3), log="x")

# add legend to right margin
legend.rm( x="center", pch=15:17, col=c("blue", "deepskyblue", "darkorchid3"),
		cex=1.5, legend=c("Reproducibility", "Within-Lab Precision", "Repeatability"),
		box.lty=0)
#' 
## End(No test)



