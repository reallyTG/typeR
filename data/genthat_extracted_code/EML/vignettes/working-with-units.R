## ------------------------------------------------------------------------
library("EML")

## ------------------------------------------------------------------------
f <- system.file("xsd/test/eml-datasetWithUnits.xml", package = "EML")
eml <- read_eml(f)

## ------------------------------------------------------------------------
attribute_tables <- eml_get(eml, "attributeList")


a <- attribute_tables$attributes
numerics <- a[a$domain == "numericDomain",]
numerics

## ------------------------------------------------------------------------
units <- numerics$unit
units[ !is_standardUnit(units) ]

## ------------------------------------------------------------------------
standardUnits <- get_unitList()
standardUnits$units

## ------------------------------------------------------------------------
customUnits <- get_unitList(eml@additionalMetadata[[1]]@metadata)
customUnits

## ------------------------------------------------------------------------

which(standardUnits$unitTypes$id == "arealDensity")
standardUnits$unitTypes[c(55,56),]

## ------------------------------------------------------------------------
i <- which(standardUnits$units$abbr == "btu")
j <- which(standardUnits$units$abbr == "μm³/kg")
standardUnits$units[c(i,j),]

## ------------------------------------------------------------------------
df <- data.frame(attributeName = "energy", 
                   attributeDefinition = "energy absorbed by the surface", 
                   unit = "britishThermalUnit", 
                   numberType = "real",
                   stringsAsFactors = FALSE)
  attributeList <- set_attributes(df, col_classes = "numeric")

## ------------------------------------------------------------------------
custom_units <- data.frame(id = "speciesPerSquareMeter", unitType = "arealDensity", parentSI = "numberPerSquareMeter", multiplierToSI = 1, description = "number of species per square meter")
set_unitList(custom_units)

## ------------------------------------------------------------------------
unique(standardUnits$unitTypes$id)

## ------------------------------------------------------------------------
unitType <- data.frame(id = c("jerk", "jerk"), dimension = c("length", "time"), power = c(1, -3) )

## ------------------------------------------------------------------------
unit <- data.frame(id = "meterPerSecondCubed", unitType = "jerk")

## ------------------------------------------------------------------------
unitList <- set_unitList(unit, unitType)

## ------------------------------------------------------------------------
eml <- new("eml", additionalMetadata = as(unitList, "additionalMetadata"))

## ----eval=FALSE----------------------------------------------------------
#  library("udunits2")

