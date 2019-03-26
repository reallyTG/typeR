library(SeerMapper2010Regs)


### Name: trXX_dXX
### Title: Provides the U.S. 2010 Census Tract Boundary data datasets for
###   15 States the have Seer Registries for use with SeerMapper Package
### Aliases: trXX_dXX trXX_d10 tr02_d10 tr04_d10 tr06_d10 tr09_d10 tr13_d10
###   tr15_d10 tr19_d10 tr21_d10 tr22_d10 tr26_d10 tr34_d10 tr35_d10
###   tr40_d10 tr49_d10 tr53_d10
### Keywords: Census2000 Census2010 SeerMapper datasets

### ** Examples

  #
  #  These examples are a test to ensure each census tract file
  #  can be read and a plot of the state generated.
  #
  require("sp")

  #
  #  If you want to save the example output PDF files, change the 
  #  the following "tempDir()" to the path you want to save the output files.
  #                For Example:   outDir <- "c:/RTestPDFs"
  outDir    <- tempdir()
  cat("Output Directory used:",outDir,"\n")
  
  stList    <- c("02","04","06","09","13",
                 "15","19","21","22","26",
                 "34","35","40","49","53")
  stName    <- c("Alaska","Arizona","California","Connecticut","Georgia",
                 "Hawaii","Iowa","Kentucky","Louisiana","Michigan",
                 "New Jersery","New Mexico","Oklahoma","Utah","Washington")
  cY        <- "10"

  outFile   <- paste0("SeerMapperRegs",cY,"-CT.pdf")
  outFN     <- file.path(outDir,outFile)
  cat("Output example PDF file:",outFN,"\n")

  pdf(outFN,width=7,height=10)

  for (stN in seq(from=1, to=length(stList), by=7)) {   # test draw 3 of 15 states

     stID   <- stList[stN]
     stNa   <- stName[stN]
     trFN   <- paste0("tr",stID,"_d",cY)
     TT_tr  <- paste0("U. S. Census Tracts - ",stNa,"  Fips=",stID,"  file=",trFN)
     
     data(list=trFN)
     
     wrSP   <- get(trFN)
     #str(wrSP)
     
     plot(wrSP,main=TT_tr)
     rm(list=trFN)
  }

  dev.off()



