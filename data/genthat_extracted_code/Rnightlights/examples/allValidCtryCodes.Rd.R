library(Rnightlights)


### Name: allValidCtryCodes
### Title: Check if all ctryCodes are valid
### Aliases: allValidCtryCodes

### ** Examples

Rnightlights:::allValidCtryCodes(c("BDI", "ETH", "KEN", "RWA", "TZA", "UGA")) #returns TRUE

#returns FALSE. "United Arab Emirates" ISO3 code = "ARE"
Rnightlights:::allValidCtryCodes(c("UGA", "UAE"))




