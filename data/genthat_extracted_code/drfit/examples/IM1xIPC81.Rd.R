library(drfit)


### Name: IM1xIPC81
### Title: Dose-Response data for 1-methyl-3-alkylimidazolium
###   tetrafluoroborates in IPC-81 cells
### Aliases: IM1xIPC81
### Keywords: datasets

### ** Examples

  rIM1xIPC81 <- drfit(IM1xIPC81, linlogit = TRUE, showED50 = TRUE, EDx = 10)

  rIM1xIPC81.drc <- drcfit(IM1xIPC81, linlogit = TRUE, showED50 = TRUE, EDx = 10)

  print(rIM1xIPC81,digits=4)
  print(rIM1xIPC81.drc,digits=4)



