library(ARTool)


### Name: Higgins1990Table5
### Title: Split-plot Experiment Examining Effect of Moisture and
###   Fertilizer on Dry Matter in Peat Pots
### Aliases: Higgins1990Table5
### Keywords: datasets

### ** Examples


data(Higgins1990Table5)
		
## run aligned-rank transform and ANOVA on the data
m <- art(DryMatter ~ Moisture*Fertilizer + (1|Tray), data=Higgins1990Table5)
anova(m)




