library(epanet2toolkit)


### Name: ENopenQ
### Title: Sets up for Water Quality analysis
### Aliases: ENopenQ

### ** Examples

inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENsolveH()
ENsetqualtype("EN_CHEM", "Chlorine", "mg/L", "")
ENopenQ()
ENinitQ(0)
ENrunQ()
ENcloseQ()
ENclose()



