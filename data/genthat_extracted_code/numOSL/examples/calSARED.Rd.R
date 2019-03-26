library(numOSL)


### Name: calSARED
### Title: SAR equivalent doses calculation and selection
### Aliases: calSARED calSARED.default
### Keywords: growth curve equivalent dose data extraction batch analysis

### ** Examples

  data(BIN)
  obj_pickBIN <- pickBINdata(BIN, Position=c(2,4,6,8,10), Grain=0, 
                             LType="OSL", view=FALSE)
  obj_analyseBIN <- analyseBINdata(obj_pickBIN, nfchn=3, nlchn=20) 
  res_SARED <- calSARED(obj_analyseBIN, model="exp", origin=FALSE)
  # plot(res_SARED$Tn[,1], res_SARED$sarED[,1], xlab="Tn", ylab="ED (<Gy>|<s>)")



