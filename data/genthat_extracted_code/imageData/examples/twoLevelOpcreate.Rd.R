library(imageData)


### Name: twoLevelOpcreate
### Title: Creates a data.frame formed by applying, for each response, a
###   binary operation to the paired values of two different treatments
### Aliases: twoLevelOpcreate
### Keywords: data manip

### ** Examples

data(exampleData)
responses <- c("Area.smooth.AGR","Area.smooth.RGR")
cols.retained <-  c("Snapshot.ID.Tag","Smarthouse","Lane","Position",
                    "Days","Snapshot.Time.Stamp", "Hour", "xDays",
                    "Zones","xZones","SHZones","ZLane","ZMainplots",
                    "xMainPosn", "Genotype.ID")
longi.SIIT.dat <- 
  twoLevelOpcreate(responses, longi.dat, suffices.treatment=c("C","S"),
                   operations = c("-", "/"), 
                   suffices.results = c("diff", "SIIT"), 
                   columns.retained = cols.retained, 
                   by = c("Smarthouse","Zones","ZMainplots","Days"))
longi.SIIT.dat <- with(longi.SIIT.dat, 
                            longi.SIIT.dat[order(Smarthouse,Zones,ZMainplots,Days),])



