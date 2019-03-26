library(WrightMap)


### Name: ppPlot
### Title: Person probability plots
### Aliases: ppPlot cutLines kidmap

### ** Examples

	
	fpath <- system.file("extdata", package="WrightMap")
	model1 <- CQmodel(p.est = file.path(fpath,"ex2.eap"), show = file.path(fpath,"ex2.shw"))
	
	#Person histogram, modern item
	ppPlot(model1,est = 0, SE = 1) 
	
	#Person density, classic item
	ppPlot(model1,est = 0, SE = 1, person.side = personDens,item.side = itemClassic) 
	



