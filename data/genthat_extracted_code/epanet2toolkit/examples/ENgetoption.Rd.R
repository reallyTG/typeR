library(epanet2toolkit)


### Name: ENgetoption
### Title: Retrieve the value of an analysis option.
### Aliases: ENgetoption

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetoption(0)
ENgetoption("EN_TRIALS")
ENclose()



