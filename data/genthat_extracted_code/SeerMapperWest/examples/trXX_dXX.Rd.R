library(SeerMapperWest)


### Name: trXX_dXX
### Title: U.S. 2000 Census Tract Boundary data datasets for 14 States
###   without Seer Registries west of the Mississippi river for use with
###   SeerMapper Package
### Aliases: trXX_dXX trXX_d00 tr05_d00 tr08_d00 tr16_d00 tr20_d00 tr27_d00
###   tr29_d00 tr30_d00 tr31_d00 tr32_d00 tr38_d00 tr41_d00 tr46_d00
###   tr48_d00 tr56_d00
### Keywords: Census2000 Census2010 SeerMapper datasets

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
                  "41","46","48","56")
  stName     <- c("Arkansas","Colorado","Idaho","Kansas","Minnesota",
                  "Missouri","Montana","Nebraska","Neveda","North Dakota",
                  "Oregon","South Dakota","Texas","Wyoming") 
  cY         <- "00"

  outFile    <- paste0("SeerMapperWest",cY,"-CT.pdf")
  outFN      <- file.path(outDir,outFile)
  cat("Output example PDF file:",outFN,"\n")
  
  pdf(outFN,width=7,height=10)

  for (stN in seq(from=1, to=length(stList), by=7)) {  # Test draw 2 of 14 states  (1 and 8)

     stID    <- stList[stN]
     stNa    <- stName[stN]
     trFN    <- paste0("tr",stID,"_d",cY)
     TT_tr   <- paste0("U. S. Census Tracts - ",stNa,"  Fips=",stID,"  file=",trFN)
     
     data(list=trFN)
     
     wrSP    <- get(trFN)
     #str(wrSP)
     
     plot(wrSP,main=TT_tr)
     rm(list=trFN)
  }

  dev.off()



