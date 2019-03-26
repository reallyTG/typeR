library(epanet2toolkit)


### Name: ENsetcontrol
### Title: Set the parameters of a simple control statement
### Aliases: ENsetcontrol

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp")  
ENopen( inp, "Net1.rpt")
ENgetcontrol(1)
ENsetcontrol(1, ctype=2, lindex=3, setting=1, nindex=0, level=54)		
ENgetcontrol(1)
ENclose() 



