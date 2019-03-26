library(MCMC.OTU)


### Name: mcmc.otu
### Title: Analyzes multivariate counts data using poisson-lognormal mixed
###   model
### Aliases: mcmc.otu

### ** Examples

	
# Symbiodinium sp diversity in two coral species at two reefs (banks)
data(green.data)

# removing outliers
goods=purgeOutliers(
	data=green.data,
	count.columns=c(4:length(green.data[1,])),
	zero.cut=0.25 # remove this line for real analysis
)

# stacking the data table
gs=otuStack(
	data=goods,
	count.columns=c(4:length(goods[1,])),
	condition.columns=c(1:3)
	)

# fitting the model
mm=mcmc.otu(
	fixed="bank+species+bank:species",
	data=gs,
	nitt=3000,burnin=2000 # remove this line for real analysis!
	)

# selecting the OTUs that were modeled reliably
acpass=otuByAutocorr(mm,gs)

# calculating effect sizes and p-values:
ss=OTUsummary(mm,gs,summ.plot=FALSE)

# correcting for mutliple comparisons (FDR)
ss=padjustOTU(ss)

# getting significatly changing OTUs (FDR<0.05)
sigs=signifOTU(ss)

# plotting them
ss2=OTUsummary(mm,gs,otus=sigs)

# bar-whiskers graph of relative changes:
# ssr=OTUsummary(mm,gs,otus=signifOTU(ss),relative=TRUE)

# displaying effect sizes and p-values for significant OTUs
ss$otuWise[sigs]




