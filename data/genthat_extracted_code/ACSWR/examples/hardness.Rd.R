library(ACSWR)


### Name: hardness
### Title: Hardness and a Block Experiment
### Aliases: hardness
### Keywords: block experiment

### ** Examples

data(hardness)
hardness$Tip_Type <- as.factor(hardness$Tip_Type)
hardness$Test_Coupon <- as.factor(hardness$Test_Coupon)
hardness_aov <- aov(Hardness~Tip_Type+Test_Coupon,data=hardness)
summary(hardness_aov)



