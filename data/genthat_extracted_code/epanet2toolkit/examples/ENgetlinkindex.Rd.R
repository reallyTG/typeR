library(epanet2toolkit)


### Name: ENgetlinkindex
### Title: Retrieve the index of a link
### Aliases: ENgetlinkindex

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetlinkindex("22")
ENclose()



