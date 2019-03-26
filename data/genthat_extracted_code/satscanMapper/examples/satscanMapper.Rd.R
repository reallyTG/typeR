library(satscanMapper)


### Name: satscanMapper
### Title: Function to map Results data produced by a SaTScan (TM) cluster
###   analysis
### Aliases: satscanMapper

### ** Examples

######
#
#  These examples focus on mapping the SaTScan (TM) data after the analysis
#  has been completed.
#  See the section on the CreateGeo4SS function for an example of how 
#  to build a coordinates file (.geo) that matches the satscanMapper 
#  boundary data.
#
######

######
#
#  Example # 1 - Mapping existing SaTScan (TM) results - "USStateLung" result files
#     Make sure SaTScan (TM) results files are still located in the directories
#     documented in the session saved (.prm) file.
#
#     This example maps data for the US States containing circular clusters.
#
#   Get location of .prm file and location to write mapping output files
#
#\dontrun{
#tempdirOut <- tempdir()
#cat("tempDirOut:",tempdirOut,"\n")

SSMInstDir <- system.file(package="satscanMapper", "extdata")
cat("SSMInstDir:",SSMInstDir,"\n")

TT =c("Contiguous US States All Lung Cancer Mortality, 2004")

satscanMapper(resDir   = SSMInstDir,                # path to .prm file location for output files. 
              prmFile  = "stateLung.prm", 
              outDir   = "",
              title    = TT    
             )
#}
#
##  end of example # 1  Removed due to time constraints.
##
######

######
#
#  Example # 2 - Mapping existing SaTScan (TM) results - "USCountyLung" result files
#     named "inc_noadj_cir" files
#     Make sure SaTScan (TM) results files are still located in the directories
#     documented in the session saved (.prm) file.
#
## Not run: 
##D #tempdirOut <- tempdir()
##D #cat("tempDirOut:",tempdirOut,"\n")
##D 
##D SSMInstDir <- system.file(package="satscanMapper", "extdata")
##D 
##D TT = "Contiguous US County Female Breast Cancer Incidence, 2009-2013"
##D 
##D satscanMapper(resDir=SSMInstDir,              # path to .prm file location for output files. 
##D               prmFile    = "inc_noadj_ellip_hilo_10_nosp.prm", 
##D               outDir     = "",
##D               categ      = 7,
##D               title      = TT,
##D               censusYear = "2010"
##D              )
##D 
## End(Not run)
#
#  end of example # 2
#
#####

print("end of examples")



