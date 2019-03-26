library(SeerMapperRegs)


### Name: trXX_dXX
### Title: Provides the U.S. 2000 Census Tract Boundary datasets for 15
###   States that have Seer Registries.
### Aliases: trXX_dXX trXX_d00 tr02_d00 tr04_d00 tr06_d00 tr09_d00 tr13_d00
###   tr15_d00 tr19_d00 tr21_d00 tr22_d00 tr26_d00 tr34_d00 tr35_d00
###   tr40_d00 tr49_d00 tr53_d00
### Keywords: Census2000 Census2010 datasets

### ** Examples

  #
  #  These examples are a test to ensure each census tract file
  #  can be read and a plot of the state generated.
  #
  stList <- c("02","04","06","09","13",
              "15","19","21","22","26",
              "34","35","40","49","53")
  stName <- c("Alaska","Arizona","California","Connecticut","Georgia",
            "Hawaii","Iowa","Kentucky","Louisiana","Michigan",
            "New Jersery","New Mexico","Oklahoma","Utah","Washington")
  cY     <- "00"
  require("sp")

  pdf("SeerMapperRegs00-Test-Res.pdf",width=7,height=10)

  for (stN in seq(from=1, to=length(stList), by=6)) {

     stID  <- stList[stN]
     stNa  <- stName[stN]
     trFN  <- paste0("tr",stID,"_d",cY)
     TT_tr <- paste0("U. S. Census Tracts - ",stNa,"  Fips=",stID,"  file=",trFN)
     
     data(list=trFN)
     
     wrSP  <- get(trFN)
     str(wrSP)
     
     plot(wrSP,main=TT_tr)
     rm(list=trFN)
  }

  dev.off()



