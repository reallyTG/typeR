library(epanet2toolkit)


### Name: ENsetpattern
### Title: Set all of the multiplier factors for a specific time pattern.
### Aliases: ENsetpattern

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENsetpattern(1, 1:10)		
ENgetpatternvalue(1,1)
ENgetpatternvalue(1,10)
ENclose()



