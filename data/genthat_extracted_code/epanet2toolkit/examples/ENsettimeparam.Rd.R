library(epanet2toolkit)


### Name: ENsettimeparam
### Title: Set the value of a time parameter.
### Aliases: ENsettimeparam

### ** Examples

# path to Net1.inp example file included with this package 
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp") 
ENopen(inp, "Net1.rpt")
ENgettimeparam("EN_HYDSTEP")
ENsettimeparam("EN_HYDSTEP", 600)
ENgettimeparam("EN_HYDSTEP")
ENclose()



