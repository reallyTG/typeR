library(epanet2toolkit)


### Name: ENgettimeparam
### Title: Get the value of one or more specific analysis time parameters.
### Aliases: ENgettimeparam

### ** Examples

# path to Net1.inp example file included with this package 
inp <- file.path( find.package("epanet2toolkit"), "extdata","Net1.inp") 
ENopen(inp, "Net1.rpt")
ENgettimeparam("EN_DURATION")
ENgettimeparam("EN_HYDSTEP")
ENclose()



