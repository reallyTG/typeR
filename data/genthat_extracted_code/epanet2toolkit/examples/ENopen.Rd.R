library(epanet2toolkit)


### Name: ENopen
### Title: Open the EPANET Toolkit.
### Aliases: ENopen

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENclose()



