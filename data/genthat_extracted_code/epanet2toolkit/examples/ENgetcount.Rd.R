library(epanet2toolkit)


### Name: ENgetcount
### Title: Get number of network elements.
### Aliases: ENgetcount

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetcount(0)
ENgetcount("EN_NODECOUNT")
ENclose()



