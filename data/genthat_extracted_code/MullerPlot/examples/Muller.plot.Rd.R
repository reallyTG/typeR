library(MullerPlot)


### Name: Muller.plot
### Title: Muller.plot
### Aliases: Muller.plot

### ** Examples

 # load information of population/abundance/frequency dynamics as list
 data(PopulationDataList)
 # load attributes of OTUs (contains name, parent and color of OTUs)
 data(Attributes)
 # Muller plot
 Muller.plot(attributes = Attributes, population.data = PopulationDataList,data.method = "list",
             time.interval.method = "linear")#'

 # load information of population/abundance/frequency dynamics as table
 data(PopulationDataTable)
 # Muller plot
 Muller.plot(attributes = Attributes, population.data = PopulationDataTable,data.method = "table")




