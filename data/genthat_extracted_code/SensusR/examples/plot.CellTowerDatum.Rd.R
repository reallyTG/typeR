library(SensusR)


### Name: plot.CellTowerDatum
### Title: Plot cell tower data.
### Aliases: plot.CellTowerDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$CellTowerDatum)



