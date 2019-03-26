library(epanet2toolkit)


### Name: ENgetlinkvalue
### Title: Retrieve parameter value for a link
### Aliases: ENgetlinkvalue

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen(inp, "Net1.rpt")
ENgetlinkvalue(1, "EN_DIAMETER")
ENgetlinkvalue(1, "EN_LENGTH")
ENgetlinkvalue(8, "EN_DIAMETER")
ENgetlinkvalue(8, "EN_LENGTH")
ENclose()



