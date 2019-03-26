library(heplots)


### Name: Probe
### Title: Response Speed in a Probe Experiment
### Aliases: Probe Probe1 Probe2
### Keywords: datasets

### ** Examples

data(Probe1)
boxplot(Probe1)

pmod1 <- lm(cbind(p1,p2,p3,p4,p5) ~ 1, data=Probe1)
idata <- data.frame(position=factor(1:5))

library(car)
(pmod1.aov <- Anova(pmod1, idata=idata, idesign=~position))

# using default contrasts (p5 as reference level)
heplot(pmod1, manova=pmod1.aov, iterm="position", type="III", idata=idata, idesign=~position)
pairs(pmod1, manova=pmod1.aov, iterm="position", type="III", idata=idata, idesign=~position)

# contrasts for substantative hypotheses regarding
# sentence position effects
C <- matrix(c(
	1, 1, -1, -1, 0,
	1, -1, 1, -1, 0,
	1, -1, -1, 1, 0,
	1, 1, 1, 1, -4), 5, 4)
rownames(C) <- paste("p", 1:5, sep="")
colnames(C) <- c("SubPred", "AdjNoun", "SPxAN", "RelPN")

contrasts(idata$position)<- C
(pmod1.aov <- Anova(pmod1, idata=idata, idesign=~position))
heplot(pmod1, manova=pmod1.aov, iterm="position", type="III", idata=idata, idesign=~position)
pairs(pmod1, manova=pmod1.aov, iterm="position", type="III", idata=idata, idesign=~position)




