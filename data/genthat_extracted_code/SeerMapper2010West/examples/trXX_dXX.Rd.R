library(SeerMapper2010West)


### Name: trXX_dXX
### Title: U.S. 2010 Census Tract Boundary data datasets for 14 States
###   without Seer Registries west of the Mississippi river for use with
###   SeerMapper Package
### Aliases: trXX_dXX trXX_d10 tr05_d10 tr08_d10 tr16_d10 tr20_d10 tr27_d10
###   tr29_d10 tr30_d10 tr31_d10 tr32_d10 tr38_d10 tr41_d10 tr46_d10
###   tr48_d10 tr56_d10
### Keywords: Census2000 Census2010 datasets

### ** Examples

  #
  #  These examples are a test to ensure each census tract file
  #  can be read and a plot of the state generated.
  #
  require("sp")

  #
  #  If you want to save and see the example output PDF files, change the 
  #  the following "tempDir()" to the path you want to save the output files.
  #                For Example:   outDir <- "c:/RTestPDFs"
  outDir     <- tempdir()
  cat("Output Directory:",outDir,"\n")
  
  stList     <- c("05","08","16","20","27",
                  "29","30","31","32","38",
                  "41","46","48","56" )
  stName     <- c("Arkansas","Colorado","Idaho","Kansas","Minnesota",
                  "Missouri","Montana","Nebraska","Neveda","North Dakota",
                  "Oregon","South Dakota","Texas","Wyoming") 
  cY     <- "10"

  outFile    <- paste0("SeerMapperWest",cY,"-CT.pdf")
  outFN      <- file.path(outDir,outFile)
  cat("Output example PDF file:",outFN,"\n")
  
  pdf(outFN,width=7,height=10)

  for (stN in seq(from=1, to=length(stList), by=7)) {   # Test draw 2 of 14 states.

     stID    <- stList[stN]
     stNa    <- stName[stN]
     trFN    <- paste0("tr",stID,"_d",cY)
     TT_tr   <- paste0("U. S. Census Tracts - ",stNa,"  Fips=",stID,"  file=",trFN)
     
     data(list=trFN)
     
     wrSP  <- get(trFN)
     #str(wrSP)
     
     plot(wrSP,main=TT_tr)
     rm(list=trFN)
  }

  dev.off()



