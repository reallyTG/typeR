library(epanet2toolkit)


### Name: ENsetlinkvalue
### Title: Set a parameter value for a link
### Aliases: ENsetlinkvalue

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen(inp, "Net1.rpt")
ENgetlinkvalue(8, "EN_LENGTH")
ENsetlinkvalue(8, "EN_LENGTH", 3333)
ENgetlinkvalue(8, "EN_DIAMETER")
ENclose()



