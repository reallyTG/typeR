library(foreSIGHT)


### Name: exSpArgsVisual
### Title: exSpArgsVisual
### Aliases: exSpArgsVisual
### Keywords: functions

### ** Examples

library(foreSIGHT)               ###Load package

###Example 1 - visualize a 2D exposure space.
exSpArgs=list(type="regGrid",
              samp=c(5,7),
              bounds=list(P_ann_tot_m=c(0.7,1.3),
                          Temp_ann_avg_m=c(-3,3)))
#windows()
exSpArgsVisual(exSpArgs=exSpArgs)




