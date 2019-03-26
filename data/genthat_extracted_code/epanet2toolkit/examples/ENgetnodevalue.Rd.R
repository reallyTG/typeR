library(epanet2toolkit)


### Name: ENgetnodevalue
### Title: Retrieve node parameter value.
### Aliases: ENgetnodevalue

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetnodevalue(1, "EN_ELEVATION")
ENgetnodevalue(5, "EN_BASEDEMAND")
ENclose()



