library(HydeNet)


### Name: writeJagsFormula
### Title: Write the JAGS Formula for a Hyde Node
### Aliases: writeJagsFormula writeJagsFormula.cpt writeJagsFormula.glm
###   writeJagsFormula.lm writeJagsFormula.multinom
###   writeJagsFormula.survreg writeJagsFormula.xtabs

### ** Examples

data(PE, package="HydeNet")
fit <- lm(d.dimer ~ pregnant + pe, data=PE)
writeJagsFormula(fit, nodes=c("d.dimer", "pregnant", "pe"))

fit.glm <- glm(death ~ pe + treat, data=PE, family="binomial")
writeJagsFormula(fit.glm, nodes=c("death", "pe", "treat"))



