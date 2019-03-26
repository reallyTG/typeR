library(epanet2toolkit)


### Name: ENrunH
### Title: run hydraulics engine
### Aliases: ENrunH

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENopenH()
ENinitH(0)
ENrunH()
ENcloseH()
ENclose()



