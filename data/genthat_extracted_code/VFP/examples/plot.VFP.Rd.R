library(VFP)


### Name: plot.VFP
### Title: Plot VFP-Ojbects.
### Aliases: plot.VFP

### ** Examples

## No test: 
library(VCA)
data(VCAdata1)
lst <- anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample")
mat <- getMat.VCA(lst)		# automatically selects "total"
mat

res <- fit.vfp(model.no=1:10, Data=mat)
plot(res)
plot(res, type="cv")
plot(res, type="cv", ci.type="lines", ci.col="red",
		Grid=list(col="wheat"), Points=list(pch=2, lwd=2, col="black"))

# same for repeatability
mat.err <- getMat.VCA(lst, "error")
res.err <- fit.vfp(1:10, Data=mat.err)
plot(res.err)

# add predictions to plot, e.g. functional sensitivity
plot(res.err, type="cv", xlim=c(0, 4), Prediction=10)

# variability at X-values are of interest
plot(res.err, type="cv", xlim=c(0, 4), Prediction=list(x=0.5))

# one can specify X- and Y-values in the "Prediction" list-argument
plot(res.err, type="cv", xlim=c(0, 4), 
		Prediction=list(x=c(0.25, 0.5), y=15))

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
plot(mod8.rep, type="cv", add=TRUE, ci.type="none",
		Points=list(pch=17, col="darkorchid3", cex=1.5),
		Line=list(col="darkorchid3", lwd=3), log="x")

# add legend to right margin
legend.rm( x="center", pch=15:17, col=c("blue", "deepskyblue", "darkorchid3"),
		cex=1.5, legend=c("Reproducibility", "Within-Lab Precision", "Repeatability"),
		box.lty=0)

# repeatability precision profile with some beautifications
plot(mod8.rep, BG="darkgray", 
		Points=list(pch=17, cex=1.5, col="blue"), Line=list(col="blue"),
		Grid=list(x=seq(0, 400, 50), y=seq(0, 100, 10), col="white"),
		Xlabel=list(cex=1.5, text="CA19-9 [U/mL]", col="blue"),
		Ylabel=list(cex=1.5, text="Repeatability on Variance-Scale", col="blue"),
		Crit=list(text.col="white", text.font=2, cex=1.25))
## End(No test)



