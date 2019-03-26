library(numOSL)


### Name: calED
### Title: Equivalent dose calculation and error assessment
### Aliases: calED calED.default
### Keywords: growth curve equivalent dose

### ** Examples

  ### Example 1:
  Curvedata <- cbind(c(0, 18, 36, 54, 72, 0, 18),               
                    c(0.026, 1.55, 2.39, 3.46, 4.13, 0.023, 1.61),  
                    c(0.005, 0.11, 0.27, 0.22, 0.20, 0.008, 0.24))                         
  Ltx <- c(3.1,0.31)
  calED(Curvedata, Ltx, model="exp", origin=FALSE)
  
  ### Example 2 (not run):
  # data(BIN)
  # obj_pickBIN <- pickBINdata(BIN, Position=48, 
  #                            LType="OSL", view=FALSE)
  # obj_analyseBIN <- analyseBINdata(obj_pickBIN, nfchn=3, nlchn=20)
  # Curvedata <- obj_analyseBIN$SARdata[-1,3:5]
  # Ltx <- as.numeric(obj_analyseBIN$SARdata[1,4:5])
  # calED(Curvedata, Ltx, model="gok", origin=FALSE)
 



