library(geometa)


### Name: ISOTemporalExtent
### Title: ISOTemporalExtent
### Aliases: ISOTemporalExtent
### Keywords: ISO extent temporal

### ** Examples

   te <- ISOTemporalExtent$new()
   start <- ISOdate(2000, 1, 12, 12, 59, 45)
   end <- ISOdate(2010, 8, 22, 13, 12, 43)
   tp <- GMLTimePeriod$new(beginPosition = start, endPosition = end)
   te$setTimePeriod(tp)




