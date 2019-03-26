library(TSsdmx)


### Name: TSsdmxMethods
### Title: Methods to wrap sdmx for TSdbi Generics
### Aliases: sdmx TSconnect,sdmxConnection,missing-method
###   TSget,character,TSsdmxConnection-method
###   TSdates,character,TSsdmxConnection-method
###   TSdescription,character,TSsdmxConnection-method
###   TSdoc,character,TSsdmxConnection-method
###   TSlabel,character,TSsdmxConnection-method
###   TSsource,character,TSsdmxConnection-method TSsdmxConnection-class
### Keywords: ts

### ** Examples

  require("TSsdmx")
  require("tfplot")
  ## Not run: 
##D   oecd <- TSconnect("sdmx", dbname="OECD")
##D   x <- TSget('G20_PRICES.CAN.CPALTT01.IXOB.M',oecd) 
##D   tfplot(x)
##D   
## End(Not run)



