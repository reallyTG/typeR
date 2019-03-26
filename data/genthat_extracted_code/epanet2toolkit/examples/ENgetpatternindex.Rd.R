library(epanet2toolkit)


### Name: ENgetpatternindex
### Title: Retrieve the index a time pattern.
### Aliases: ENgetpatternindex

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetpatternindex("1")
ENclose()



