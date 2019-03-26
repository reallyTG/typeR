library(perspectev)


### Name: perspectev.test
### Title: Test for irreducibility of relationship between upper level
###   traits and survivorship
### Aliases: perspectev.test

### ** Examples

	data(testData)

  	data = perspectev.read(testData,extinctionAge=5,occurrenceAge="Age",
  	upper="Genus",lower="Species",traits=c("Lat","Long"),traitfun=mcpRange,projection=FALSE)

  	#4 iterations chosen out of convenience - use more!
	mcpTest  = perspectev.test(data,4,1,traitfun=mcpRange)
	mcpSim  = perspectev.simulate(data,4,1,traitfun=mcpRange)
	perspectev.plot(mcpTest,list(mcpSim),c("S1"),"Test")



