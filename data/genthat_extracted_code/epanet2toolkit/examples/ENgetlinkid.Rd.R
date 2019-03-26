library(epanet2toolkit)


### Name: ENgetlinkid
### Title: Retrieve the ID label of a link
### Aliases: ENgetlinkid

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetlinkid(1)
ENgetlinkid(12)
ENclose()



