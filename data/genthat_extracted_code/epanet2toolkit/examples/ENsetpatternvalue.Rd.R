library(epanet2toolkit)


### Name: ENsetpatternvalue
### Title: set pattern value
### Aliases: ENsetpatternvalue

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetpatternvalue(1,3)
ENsetpatternvalue(1,3, 9.876)
ENgetpatternvalue(1,3)
ENclose()



