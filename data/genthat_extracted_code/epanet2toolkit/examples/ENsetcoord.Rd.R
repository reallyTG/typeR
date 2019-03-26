library(epanet2toolkit)


### Name: ENsetcoord
### Title: Set coordinates for a node
### Aliases: ENsetcoord

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetcoord(3)
ENsetcoord(3,33,44)
ENgetcoord(3)
ENclose()



