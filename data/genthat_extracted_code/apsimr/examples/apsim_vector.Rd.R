library(apsimr)


### Name: apsim_vector
### Title: Edit and Run an APSIM Simulation
### Aliases: apsim_vector

### ** Examples

## Not run: 
##D meanCowpea<-function(X){
##D  return(mean(X$lai_cowpea))
##D }
##D 
##D apsimWd <- "~/APSIM"
##D apsimVar <- c(rep("SoilWater/Thickness",11), "SoilOrganicMatter/SoilCN")
##D apsimValue <- matrix(c(rep(200, 2), rep(300, 9), 10,
##D                        rep(350, 2), rep(350, 9), 5),nrow=2,byrow=T)
##D apsimExe <-"C:/Program Files (x86)/Apsim75-r3008/Model/Apsim.exe"
##D apsimFile <- "Canopy.apsim"
##D 
##D #Run APSIM at each new parameter vector specified by apsimVar and only return the mean cowpea value
##D uniRes <- apsim_vector(X = apsimValue, exe = apsimExe, wd = apsimWd, vars = apsimVar,
##D          to.run = apsimFile, to.edit = apsimFile, g = meanCowpea)
##D uniRes
##D 
##D 
##D allCowpea <- function(x){
##D  return(x$lai_cowpea)
##D }
##D 
##D #Use allCowpea function to return all the cowpea values
##D multiRes <- apsim_vector(X = apsimValue, exe = apsimExe, wd = apsimWd, vars = apsimVar,
##D              to.run = apsimFile, to.edit = apsimFile, g = allCowpea)
##D multiRes
## End(Not run)



