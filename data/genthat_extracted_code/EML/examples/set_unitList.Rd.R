library(EML)


### Name: set_unitList
### Title: set_unitList
### Aliases: set_unitList

### ** Examples


 ## create the "unitType" table for custom unit
 id = c("speed", "speed", "acceleration", "acceleration", "frequency")
 dimension = c("length", "time", "length", "time", "time")
 power = c(NA, "-1", NA, "-2", "-1")
 unitTypes <- data.frame(id = id, dimension = dimension,
                         power = power, stringsAsFactors = FALSE)

 ## Create the units table
 id = c("minute", "centimeter")
 unitType = c("time", "length")
 parentSI = c("second", "meter")
 multiplierToSI = c("0.0166", "1")
 description = c("one minute is 60 seconds", "centimeter is a 100th of a meter")
 units = data.frame(id = id, unitType = unitType, parentSI = parentSI,
                    multiplierToSI = multiplierToSI, description = description,
                    stringsAsFactors = FALSE)

 unitList <- set_unitList(units, unitTypes)

 ## reverse operation also works:
 get_unitList(unitList)

 ## To add this to an EML document:
 new("eml", additionalMetadata = as(unitList, "additionalMetadata"))

 ## Equivalently:
 additionalMetadata <- set_unitList(units, unitTypes, as_metadata = TRUE)
 new("eml", additionalMetadata = additionalMetadata)



