library(HSAUR)


### Name: BCG
### Title: BCG Vaccine Data
### Aliases: BCG
### Keywords: datasets

### ** Examples


  data("BCG", package = "HSAUR")
  boxplot(BCG$BCGTB/BCG$BCGVacc, BCG$NoVaccTB/BCG$NoVacc,
          names = c("BCG Vaccination", "No Vaccination"), 
          ylab = "Percent BCG cases")




