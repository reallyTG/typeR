library(ABCanalysis)


### Name: ABCanalysis-package
### Title: Computed ABC analysis
### Aliases: ABCanalysis-package ABCanalyse dbt.ABC dbt.ABCanalyse
###   dbt.ABCanalysis
### Keywords: package

### ** Examples

  data("SwissInhabitants")
	abc=ABCanalysis(SwissInhabitants,PlotIt=TRUE)
	SetA=SwissInhabitants[abc$Aind]
	SetB=SwissInhabitants[abc$Bind]
	SetC=SwissInhabitants[abc$Cind]



