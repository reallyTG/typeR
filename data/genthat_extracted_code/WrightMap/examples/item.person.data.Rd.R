library(WrightMap)


### Name: item.person.data
### Title: Processing CQmodel objects for plotting
### Aliases: item.person.data itemData itemData.default itemData.CQmodel
###   itemData.character personData personData.default personData.CQmodel
###   personData.character

### ** Examples

	
#As a call from wrightMap:

fpath <- system.file("extdata", package="WrightMap")

model1 <- CQmodel(file.path(fpath,"ex2a.eap"), file.path(fpath,"ex2a.shw"))
# Making thresholds if there are no GIN tables (partial credit model)
	wrightMap(model1, type = "thresholds") 
	
#Complex model:

model2 <- CQmodel(file.path(fpath,"ex4a.mle"), file.path(fpath,"ex4a.shw")) 
wrightMap(model2, item.table = "rater")
	wrightMap(model2, item.table = "rater", interactions = "rater*topic", 
  step.table = "topic")


# Plotting item results
	
	fpath <- system.file("extdata", package="WrightMap")
	model3 <- CQmodel(file.path(fpath,"ex2a.eap"), file.path(fpath,"ex2a.shw"))
	m3.item <- itemData(model3)
	
	dev.new(width=10, height=10)
	
	#control of oma allows us to give more space to longer item names
	itemModern(m3.item, label.items.srt= 90, oma = c(2,0,0,2)) 
	itemClassic(m3.item)
	itemHist(m3.item)
	
	m3.person <- personData(model3)
	personHist(m3.person)
	personDens(m3.person)
  


