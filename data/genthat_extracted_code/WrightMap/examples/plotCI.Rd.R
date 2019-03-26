library(WrightMap)


### Name: plotCI
### Title: Plotting confidence intervals and DIF
### Aliases: difplot difplot.default difplot.CQmodel difplot.character
###   plotCI

### ** Examples

	#Plotting confidence intervals
	
	ests <- rnorm(10,sd = .5)
	errors <- runif(10,min = .1,max = .5)
	plotCI(ests,errors,ylim = c(-3,3))
	
	#DIF plot:
	
	fpath <- system.file("extdata", package="WrightMap")

	# equation must be specified because there is no summary of estimation 
	# table in this example
	difplot(file.path(fpath,"ex6a.shw"), equation = "item-gender+item*gender") 




