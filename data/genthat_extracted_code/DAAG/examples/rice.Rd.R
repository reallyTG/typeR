library(DAAG)


### Name: rice
### Title: Genetically Modified and Wild Type Rice Data
### Aliases: rice
### Keywords: datasets

### ** Examples

print("One and Two-Way Comparisons - Example 4.5")
attach(rice)
oldpar <- par(las = 2)
stripchart(ShootDryMass ~ trt, pch=1, cex=1, xlab="Level of factor 1")
detach(rice)
pause()

rice.aov <- aov(ShootDryMass ~ trt, data=rice); anova(rice.aov)
anova(rice.aov)
pause()

summary.lm(rice.aov)$coef
pause()

rice$trt <- relevel(rice$trt, ref="NH4Cl")
  # Set NH4Cl as the baseline

fac1 <- factor(sapply(strsplit(as.character(rice$trt)," \\+"), function(x)x[1]))
anu843 <- sapply(strsplit(as.character(rice$trt), "\\+"), 
function(x)c("wt","ANU843")[length(x)])
anu843 <- factor(anu843, levels=c("wt", "ANU843"))
attach(rice)
interaction.plot(fac1, anu843, ShootDryMass)
detach(rice)
par(oldpar)




