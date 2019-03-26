library(HSAUR3)


### Name: BCG
### Title: BCG Vaccine Data
### Aliases: BCG
### Keywords: datasets

### ** Examples


  data("BCG", package = "HSAUR3")

  ### sort studies w.r.t. sample size
  BCG <- BCG[order(rowSums(BCG[,2:5])),]

  ### to long format
  BCGlong <- with(BCG, data.frame(Freq = c(BCGTB, BCGVacc - BCGTB, 
                                           NoVaccTB, NoVacc - NoVaccTB),
                  infected = rep(rep(factor(c("yes", "no")), 
                                 rep(nrow(BCG), 2)), 2),
                  vaccined = rep(factor(c("yes", "no")), 
                                 rep(nrow(BCG) * 2, 2)),
                  study = rep(factor(Study, levels = as.character(Study)), 
                              4)))

  ### doubledecker plot
  library("vcd")
  doubledecker(xtabs(Freq ~ study + vaccined + infected, 
                     data = BCGlong))




