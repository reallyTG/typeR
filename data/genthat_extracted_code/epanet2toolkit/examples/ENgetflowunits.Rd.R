library(epanet2toolkit)


### Name: ENgetflowunits
### Title: Retrieve a code number indicating the units used to express all
###   flow rates.
### Aliases: ENgetflowunits

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetflowunits()
ENclose()



