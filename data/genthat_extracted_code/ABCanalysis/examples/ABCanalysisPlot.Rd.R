library(ABCanalysis)


### Name: ABCanalysisPlot
### Title: Displays ABC plot with ABCanalysis
### Aliases: ABCanalysisPlot
### Keywords: ABCanalysis ABC analysis

### ** Examples

## Standard Example
	data("SwissInhabitants")
	abc=ABCanalysisPlot(SwissInhabitants)
##	Multiple plots in one Window:
	m=runif(4,100,200)
	s=runif(4,1,10)
	Data=sapply(1:4,FUN=function(x,m,s) rnorm(1000,m,s),m,s)
	# windows() #screen devices should not be used in examples etc
	par(mfrow=c(2,2))
	for (i in 1:4)
	{
		ABCanalysisPlot(Data[,i],ResetPlotDefaults=FALSE)
	}




