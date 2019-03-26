library(epanet2toolkit)


### Name: ENgetpatternvalue
### Title: Retrieve the multiplier factor for a specific time period
### Aliases: ENgetpatternvalue

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetpatternvalue(1,1)
ENgetpatternvalue(1,2)
ENgetpatternvalue(1,3)
ENclose()



