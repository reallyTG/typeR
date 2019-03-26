library(epanet2toolkit)


### Name: ENgetpatternid
### Title: Retrieve the ID label a time pattern
### Aliases: ENgetpatternid

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetpatternid(1)
ENclose()



