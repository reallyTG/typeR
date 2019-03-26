library(SeerMapper2010East)


### Name: trXX_dXX
### Title: Provides the U.S. 2000 Census Tract Boundary data datasets for
###   23 States East of the Mississippi River for use with SeerMapper
###   Package
### Aliases: trXX_dXX trXX_d10 tr01_d10 tr10_d10 tr11_d10 tr12_d10 tr17_d10
###   tr18_d10 tr23_d10 tr24_d10 tr25_d10 tr28_d10 tr33_d10 tr36_d10
###   tr37_d10 tr39_d10 tr42_d10 tr44_d10 tr45_d10 tr47_d10 tr50_d10
###   tr51_d10 tr54_d10 tr55_d10 tr72_d10
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
  
  stList     <- c("01","10","11","12","17",
                  "18","23","24","25","28",
                  "33","36","37","39","42",
                  "44","45","47","50","51",
                  "54","55","72"
                 )
  stName     <- c("Alabama","Delaware","Dist.of Columbia","Florida","Illinois",
                  "Indiana","Maine","Maryland","Massachusetts","Mississippi",
                  "New Hampshire","New York","North Carolina","Ohio","Pennsylvania",
                  "Rhode Island","South Carolina","Tennessee","Vermont","Virginia",
                  "West Virginia","Wisconsin","Puerto Rico"
                )
  cY         <- "10"

  outFile    <- paste0("SeerMapperEast",cY,"-CT.pdf")
  outFN      <- file.path(outDir,outFile)
  cat("Output example PDF file:",outFN,"\n")
  
  pdf(outFN,width=7,height=10)

  for (stN in seq(from=1, to=length(stList), by=8)) {  # Test print 3 of 23 states.

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



