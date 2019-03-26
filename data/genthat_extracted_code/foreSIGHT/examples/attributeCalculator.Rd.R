library(foreSIGHT)


### Name: attributeCalculator
### Title: attributeCalculator
### Aliases: attributeCalculator
### Keywords: functions

### ** Examples

###Example 1 - calculate attributes for full length of data
data(tankDat)
attSel=c("P_ann_tot_m","P_ann_dyWet_m","P_ann_dyAll_m")
out=attributeCalculator(obs = tank_obs,
                        attSel = attSel,
                        slice=NULL,
                        window=NULL)




