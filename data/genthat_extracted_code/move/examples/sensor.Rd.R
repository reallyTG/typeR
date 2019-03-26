library(move)


### Name: sensor
### Title: Extract the sensor of a Move unUsedRecords object
### Aliases: sensor sensor,.MoveTrack-method sensor,.unUsedRecords-method

### ** Examples

data(leroy)
head(sensor(leroy)) ## get the sensor from a Move object

head(sensor(unUsedRecords(leroy))) ## get the sensor from the unused records of a Move object

data(fishers)
head(sensor(fishers)) ## get the sensor from a MoveStack object



