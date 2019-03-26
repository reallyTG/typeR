library(heplots)


### Name: RatWeight
### Title: Weight Gain in Rats Exposed to Thiouracil and Thyroxin
### Aliases: RatWeight
### Keywords: datasets

### ** Examples

data(RatWeight)
contrasts(RatWeight$trt)

rat.mod <- lm(cbind(wt0, wt1, wt2, wt3, wt4) ~ trt, data=RatWeight)
rat.mod

idata <- data.frame(week = ordered(0:4))
Anova(rat.mod, idata=idata, idesign=~week, test="Roy")

# quick look at between group effects
pairs(rat.mod)

# between-S, baseline & week 4
heplot(rat.mod, col=c("red", "blue", "green3", "green3"),
	variables=c(1,5),
	hypotheses=c("trt1", "trt2"),
	main="Rat weight data, Between-S effects") 

# within-S
heplot(rat.mod, idata=idata, idesign=~week, iterm="week",
	col=c("red", "blue", "green3"),
#	hypotheses=c("trt1", "trt2"),
	main="Rat weight data, Within-S effects")




