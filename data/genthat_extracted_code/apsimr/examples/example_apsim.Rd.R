library(apsimr)


### Name: example_apsim
### Title: Access Example APSIM Simulations
### Aliases: example_apsim

### ** Examples

## Not run: 
##D apsimPath <-"C:/Program Files (x86)/Apsim75-r3008/"
##D apsimWd <- "~/APSIM"
##D toRun <- "Canopy.apsim"
##D example_apsim(path = apsimPath, wd = apsimWd, files = toRun) #TRUE
##D 
##D toRun <- c("Canopy.apsim", "Continuous Wheat.apsim")
##D example_apsim(path = apsimPath, wd = apsimWd, files = toRun) #TRUE TRUE
##D 
##D apsimExe <-"C:/Program Files (x86)/Apsim75-r3008/Model/Apsim.exe"
##D results <- apsim(exe = apsimExe, wd = apsimWd, files = toRun)
##D plot(results[[1]])
## End(Not run)



