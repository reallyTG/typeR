library(apsimr)


### Name: apsim_emul_sa
### Title: Emulator-Based Sensitivity Analysis
### Aliases: apsim_emul_sa

### ** Examples

## Not run: 
##D meanYield<-function(x){
##D  return(mean(x$lai_cowpea))
##D }
##D n <- 75
##D parValues <- data.frame(SoilCN = runif(n, 5, 25),
##D                  DiffusConst = runif(n, 20, 50), CNCov = runif(n, 0, 1))
##D apsimExe <-"C:/Program Files (x86)/Apsim75-r3008/Model/Apsim.exe"
##D apsimWd <- "~/APSIM"
##D apsimVars <- c("SoilOrganicMatter/SoilCN", "SoilWater/DiffusConst", "SoilWater/CNCov")
##D apsimFile <- "Canopy.apsim"
##D emulRes <- apsim_emul_sa(model = apsim_vector, X = parValues, method = "singleGAM",
##D              exe = apsimExe, wd = apsimWd, vars = apsimVars, to.run = apsimFile,
##D              g = meanYield, overwrite = TRUE)
##D 
##D emulRes
##D plot(emulRes)
##D 
## End(Not run)



