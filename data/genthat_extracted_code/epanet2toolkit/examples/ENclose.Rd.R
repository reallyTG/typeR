library(epanet2toolkit)


### Name: ENclose
### Title: Close down the EPANET Toolkit system.
### Aliases: ENclose

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENclose()



