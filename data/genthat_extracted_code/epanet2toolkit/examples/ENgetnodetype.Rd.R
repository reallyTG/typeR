library(epanet2toolkit)


### Name: ENgetnodetype
### Title: Retrieve the node-type code
### Aliases: ENgetnodetype

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetnodetype(1)
ENgetnodetype(10)
ENgetnodetype(11)
ENclose()



