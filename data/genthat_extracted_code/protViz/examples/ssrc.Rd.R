library(protViz)


### Name: ssrc
### Title: Sequence Specific Retention Calculator
### Aliases: ssrc hydrophobicity

### ** Examples


  # example of table iv [PMID:15238601]
  lapply(c("SCHTAVGR", "SCHTGLGR", "EDLIAYLK"), ssrc)
  
  plot(sapply(as.character(iRTpeptides$peptide), ssrc) ~  iRTpeptides$rt)



