library(epanet2toolkit)


### Name: ENreport
### Title: Write simulation report to the report file
### Aliases: ENreport

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt", "Net1.bin")
ENsolveH()
ENsolveQ()
ENreport()
ENclose()



