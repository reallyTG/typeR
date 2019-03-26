library(bigleaf)


### Name: energy.closure
### Title: Energy Balance Closure
### Aliases: energy.closure

### ** Examples

## characterize energy balance closure for DE-Tha in June 2014
energy.closure(DE_Tha_Jun_2014,instantaneous=FALSE)

## look at half-hourly closure 
EBR_inst <- energy.closure(DE_Tha_Jun_2014,instantaneous=TRUE)
summary(EBR_inst)




