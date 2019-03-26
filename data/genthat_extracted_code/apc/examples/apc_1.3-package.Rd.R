library(apc)


### Name: apc-package
### Title: Age-period-cohort analysis
### Aliases: apc-package apc
### Keywords: package models regression htest hplot

### ** Examples

########################
#	Belgian lung cancer

#######
#	1. Get apc.data.list
#	This is ready made.  For other data construct list using apc.data.list

data.list	<- data.Belgian.lung.cancer()
objects(data.list)
data.list

#######
#	2. Plot data
#	Plot all data.
#	Note a warning is produced because the defaults settings
#	lead to an unbalanced grouping of data.

apc.plot.data.all(data.list)

#	Or make individual plots.
#	Plot data sums.

graphics.off()
apc.plot.data.sums(data.list)

#	Plot sparsity to see where data are thin.
#	Plots are blank with default settings
#	... therefore change sparsity.limits.

graphics.off()
apc.plot.data.sparsity(data.list)
dev.new()
apc.plot.data.sparsity(data.list,sparsity.limits=c(5,10))

#	Plot data using different pairs of the three time scales.
#	This plot is done for mortality ratios.
#	All plots appear to have approximately parallel lines.
#	This indicates that interpretation should be done carefully.

graphics.off()
apc.plot.data.within.all.six(data.list,"m")

#######
#	3. Get a deviance table
#	Need to input distribution.
#   The table show that the sub-models "AC" and "Ad"
#	cannot be rejected relative to the unrestricted "APC" model

apc.fit.table(data.list,"poisson.dose.response")

#######
#	4. Estimate selected models
#	Consider "APC" and "Ad"
#	Consider also the sub-model "A", which is not supported by
#	the tests in the deviance table

fit.apc	<- apc.fit.model(data.list,"poisson.dose.response","APC")
fit.ad	<- apc.fit.model(data.list,"poisson.dose.response","Ad")
fit.a	<- apc.fit.model(data.list,"poisson.dose.response","A")

#	Get coefficients for canonical parameters through

fit.apc$coefficients.canonical
fit.ad$coefficients.canonical

#######
#	5. Residual analysis.
#	Plot estimators, probability transforms of responses given fit,
# 	residuals, fitted values, linear predictors, and data.
#	In probability transform plot:
#	Black circle are used for central part of distribution.
#	Triangles are used in tails, green/blue/red as responses are further in tail
#	No sign of mis-specification for "APC" and "Ad": there are many
#	black circles and only few coloured triangles.
#	In comparison the model "A" yields more extreme observations.
#	That model is not supported by the data.  
#	To get numerical values see apc.plot.fit.pt

graphics.off()
apc.plot.fit.all(fit.apc)
apc.plot.fit.all(fit.ad)
apc.plot.fit.all(fit.a)

#######
#	6. Plot estimated coefficients for sub models 
#	Consider "APC" and "Ad"
#	The first row of plots show double differences of paramters
#	The second row of plots shows level and slope determining a linear plane
#	The third row shows double sums of double differences,
#	all identified to be zero at the begining and at the end.
#	Thus the plots in third row must be interpreted jointly with those in the
#	second row.  The interpretation of the third row plots
#	is that they show deviations from linear trends.  The third row plots are
#	not invariant to changes to data array

graphics.off()
apc.plot.fit(fit.apc)
dev.new()
apc.plot.fit(fit.ad)
dev.new()
apc.plot.fit(fit.a)

#######
#	7. Recursive analysis
#	Cut the first period group and redo analysis

data.list.subset.1 <- apc.data.list.subset(data.list,0,0,1,0,0,0)
apc.fit.table(data.list.subset.1,"poisson.dose.response")

#######
#	8. Effect of ad hoc identification
#	At first a subset is chosen where youngest age and cohort groups
#	are truncated.  This way sparsity is eliminated
#	and ad hoc identification effects are dominated by estimation
#	uncertainty. Then consider
#	Plot 1: parameters estimated from data without first age groups
#	Plot 2: parameters estimated from all data
#	Note that estimates for double difference very similar.
#	Estimates for linear slopes are changed because the indices used
#	for parametrising these are changed
#	Estimates for detrended double sums of age and cohort double differences
#	are changed, because they rely on a particular ad hoc identifications
#	that have changed.  Nonetheless these plots are useful to evaulate
#	variation in time trends over and above linear trends.

graphics.off()
data.list	<- data.Belgian.lung.cancer()
data.list.subset <- apc.data.list.subset(data.list,2,0,0,0,0,0)
fit.apc		<- apc.fit.model(data.list,"poisson.dose.response","APC")
fit.apc.subset	<- apc.fit.model(data.list.subset,"poisson.dose.response","APC")
apc.plot.fit(fit.apc.subset,main.outer="1. Belgian lung cancer: cut first two age groups")
dev.new()
apc.plot.fit(fit.apc,main.outer="2. Belgian lung cancer data: all data")






