library(epanet2toolkit)


### Name: ENsolveQ
### Title: Solve network water quality for all time periods
### Aliases: ENsolveQ

### ** Examples

inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt","Net1.bin")
ENsolveH()
ENsetqualtype("EN_CHEM", "Chlorine", "mg/L", "")
ENsolveQ()
ENclose()



