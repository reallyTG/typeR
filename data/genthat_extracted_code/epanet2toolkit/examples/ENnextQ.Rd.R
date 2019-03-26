library(epanet2toolkit)


### Name: ENnextQ
### Title: Advances WQ simulation to start of the next hydraulic time
###   period.
### Aliases: ENnextQ

### ** Examples

inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENsolveH()
ENsetqualtype("EN_CHEM", "Chlorine", "mg/L", "")
ENopenQ()
ENinitQ(0)
ENrunQ()
ENnextQ()
ENrunQ()
ENcloseQ()



