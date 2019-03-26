library(Biograph)


### Name: Biograph.mstate
### Title: Converts Biograph object to mstate object of class "msdata"
### Aliases: Biograph.mstate
### Keywords: msdata remove.intrastate

### ** Examples

  data (GLHS)
  D <- Biograph.mstate (GLHS)
  # Function events of mstate package
  library (mstate)
  events (D)
  s <- coxph(Surv(Tstart,Tstop,status)~edu+sex,data=D,method="breslow")



