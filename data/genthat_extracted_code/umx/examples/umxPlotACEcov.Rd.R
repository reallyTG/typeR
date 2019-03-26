library(umx)


### Name: umxPlotACEcov
### Title: Make a graphical display of an ACE model with covariates.
### Aliases: umxPlotACEcov plot.MxModelACEcov

### ** Examples

require(umx)
# BMI ?twinData from Australian twins. 
# Cohort 1 Zygosity 1 == MZ females 3 == DZ females
data(twinData)
# Pick the variables. We will use base names (i.e., "bmi") and set suffix.
selDVs  = c("bmi")
selCovs = c("ht")
selVars = umx_paste_names(c(selDVs, selCovs), sep = "", suffixes= 1:2)
# Just top few pairs so example runs quickly
mzData = subset(twinData, zygosity == "MZFF", selVars)[1:100, ]
dzData = subset(twinData, zygosity == "DZFF", selVars)[1:100, ]
m1 = umxACEcov(selDVs = selDVs, selCovs = selCovs, dzData = dzData, mzData = mzData, 
	 sep = "", autoRun = TRUE)
plot(m1)
plot(m1, std = FALSE) # don't standardize



