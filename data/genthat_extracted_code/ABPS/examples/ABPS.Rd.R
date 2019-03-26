library(ABPS)


### Name: ABPS
### Title: A function for calculating the Abnormal Blood Profile Score
### Aliases: ABPS

### ** Examples

ABPS(HCT=43.2, HGB=14.6, MCH=31.1, MCHC=33.8, MCV=92.1, RBC=4.69, RETP=0.48)
ABPS(data.frame(HCT=43.2, HGB=14.6, MCH=31.1, MCHC=33.8, MCV=92.1, RBC=4.69, RETP=0.48))
ABPS(c(43.2, 14.6, 31.1, 33.8, 92.1, 4.69, 0.48))
data(blooddoping); ABPS(blooddoping)
data(bloodcontrol); ABPS(bloodcontrol)




