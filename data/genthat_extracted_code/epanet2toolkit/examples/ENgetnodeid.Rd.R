library(epanet2toolkit)


### Name: ENgetnodeid
### Title: Retrieve the ID label a node.
### Aliases: ENgetnodeid

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetnodeid(1)
ENgetnodeid(5)
ENgetnodeid(9)
ENclose()



