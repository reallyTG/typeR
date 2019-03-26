library(epanet2toolkit)


### Name: ENgetlinknodes
### Title: Retrieve the index of the end nodes of a link
### Aliases: ENgetlinknodes

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetlinknodes(1)
ENgetlinknodes(11)
ENclose()



