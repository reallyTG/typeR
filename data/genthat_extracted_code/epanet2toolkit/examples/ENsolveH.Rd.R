library(epanet2toolkit)


### Name: ENsolveH
### Title: ENsolveH
### Aliases: ENsolveH

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt","Net1.bin")
ENsolveH()
ENsolveQ()
ENgetnodevalue(2, "EN_PRESSURE")
ENclose() 



