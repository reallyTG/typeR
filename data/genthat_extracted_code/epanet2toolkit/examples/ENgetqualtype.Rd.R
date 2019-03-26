library(epanet2toolkit)


### Name: ENgetqualtype
### Title: Retrieve the type of water quality analysis called for.
### Aliases: ENgetqualtype ENgetqualtype

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetqualtype()
ENclose()
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetqualtype()
ENclose()



