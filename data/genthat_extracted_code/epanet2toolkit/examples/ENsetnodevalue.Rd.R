library(epanet2toolkit)


### Name: ENsetnodevalue
### Title: Set the parameter value for a node.
### Aliases: ENsetnodevalue

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetnodevalue(3, "EN_ELEVATION")
ENsetnodevalue(3, "EN_ELEVATION", 777)
ENgetnodevalue(3, "EN_ELEVATION")
ENclose()



