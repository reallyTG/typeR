library(epanet2toolkit)


### Name: ENgetqualinfo
### Title: Get quality analysis information
### Aliases: ENgetqualinfo

### ** Examples

inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetqualinfo()
ENclose()



