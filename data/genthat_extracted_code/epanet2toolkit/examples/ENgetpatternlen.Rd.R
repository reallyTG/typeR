library(epanet2toolkit)


### Name: ENgetpatternlen
### Title: Retrieve the number of time periods in a time pattern.
### Aliases: ENgetpatternlen

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetpatternlen(1)
ENclose()



