library(epanet2toolkit)


### Name: ENgetlinktype
### Title: Retrieve the type code for a link
### Aliases: ENgetlinktype

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetlinktype(1)
ENgetlinktype(12)
ENclose()



