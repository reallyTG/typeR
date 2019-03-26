library(epanet2toolkit)


### Name: ENsetoption
### Title: Set the value of a particular analysis option.
### Aliases: ENsetoption

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetoption("EN_TRIALS")
ENsetoption("EN_TRIALS", 22)
ENgetoption("EN_TRIALS")
ENclose()



