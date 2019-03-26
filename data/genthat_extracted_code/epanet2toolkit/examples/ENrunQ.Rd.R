library(epanet2toolkit)


### Name: ENrunQ
### Title: Computs WQ results at current time .
### Aliases: ENrunQ

### ** Examples

inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENsolveH()
ENsetqualtype("EN_CHEM", "Chlorine", "mg/L", "")
ENopenQ()
ENinitQ(0)
ENrunQ()
ENcloseQ()



