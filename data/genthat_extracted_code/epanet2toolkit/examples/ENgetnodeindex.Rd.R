library(epanet2toolkit)


### Name: ENgetnodeindex
### Title: Retrieve the index of a node
### Aliases: ENgetnodeindex

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetnodeindex("10")
ENgetnodeindex("23")
ENclose()



