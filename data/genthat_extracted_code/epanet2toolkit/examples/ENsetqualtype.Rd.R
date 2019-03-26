library(epanet2toolkit)


### Name: ENsetqualtype
### Title: Set the type of water quality analysis called for.
### Aliases: ENsetqualtype

### ** Examples

inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetqualtype()
ENsetqualtype("EN_CHEM", "Chlorine", "mg/L", "")
ENgetqualtype()
ENclose()



