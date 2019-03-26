library(intubate)


### Name: iRegression
### Title: Interfaces for iRegression package for data science pipelines.
### Aliases: ntbt_bivar ntbt_ccrm ntbt_cm ntbt_crm ntbt_MinMax
### Keywords: intubate magrittr iRegression bivar ccrm cm crm MinMax

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(iRegression)
##D 
##D ## bivar
##D data("soccer.bivar", package = "iRegression")
##D 
##D ## Original function to interface
##D bivar(yMin ~ t1Min + t2Min, "identity", yMax ~ t1Max + t2Max, "identity", data = soccer.bivar)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bivar(soccer.bivar, yMin ~ t1Min + t2Min, "identity", yMax ~ t1Max + t2Max, "identity")
##D 
##D ## so it can be used easily in a pipeline.
##D soccer.bivar %>%
##D   ntbt_bivar(yMin ~ t1Min + t2Min, "identity", yMax ~ t1Max + t2Max, "identity")
##D 
##D ## ntbt_ccrm
##D data("Cardiological.CR", package = "iRegression")
##D ## Original function to interface
##D ccrm(PulseC ~ SystC + DiastC, PulseR ~ SystR + DiastR, data = Cardiological.CR)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ccrm(Cardiological.CR, PulseC ~ SystC + DiastC, PulseR ~ SystR + DiastR)
##D 
##D ## so it can be used easily in a pipeline.
##D Cardiological.CR %>%
##D   ntbt_ccrm(PulseC ~ SystC + DiastC, PulseR ~ SystR + DiastR)
##D 
##D ## ntbt_cm
##D data("Cardiological.MinMax", package = "iRegression") ## see Billard and Diday (2000)
##D ## Original function to interface
##D cm(PulseMin ~ SystMin + DiastMin, PulseMax ~ SystMax + DiastMax, data = Cardiological.MinMax)
##D 
##D ## The interface puts data as first parameter
##D ntbt_cm(Cardiological.MinMax, PulseMin ~ SystMin + DiastMin, PulseMax ~ SystMax + DiastMax)
##D 
##D ## so it can be used easily in a pipeline.
##D Cardiological.MinMax %>%
##D   ntbt_cm(PulseMin ~ SystMin + DiastMin, PulseMax ~ SystMax + DiastMax)
##D 
##D ## ntbt_crm
##D data("Cardiological.CR", package = "iRegression")
##D ## Original function to interface
##D crm(PulseC ~ SystC + DiastC, PulseR ~ SystR + DiastR, data = Cardiological.CR)
##D 
##D ## The interface puts data as first parameter
##D ntbt_crm(Cardiological.CR, PulseC ~ SystC + DiastC, PulseR ~ SystR + DiastR)
##D 
##D ## so it can be used easily in a pipeline.
##D Cardiological.CR %>%
##D   ntbt_crm(PulseC ~ SystC + DiastC, PulseR ~ SystR + DiastR)
##D 
##D ## ntbt_MinMax
##D data("Cardiological.MinMax", package = "iRegression") ## see Billard, L. and Diday, E. (2000)
##D ## Original function to interface
##D MinMax(PulseMin ~ SystMin + DiastMin, PulseMax ~ SystMax + DiastMax, data = Cardiological.MinMax)
##D 
##D ## The interface puts data as first parameter
##D ntbt_MinMax(Cardiological.MinMax, PulseMin ~ SystMin + DiastMin, PulseMax ~ SystMax + DiastMax)
##D 
##D ## so it can be used easily in a pipeline.
##D Cardiological.MinMax %>%
##D   ntbt_MinMax(PulseMin ~ SystMin + DiastMin, PulseMax ~ SystMax + DiastMax)
## End(Not run)



