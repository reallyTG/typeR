library(epanet2toolkit)


### Name: ENgetcoord
### Title: Get coordinates for a node
### Aliases: ENgetcoord

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetcoord(3)
ENclose()



