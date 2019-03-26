library(POT)


### Name: chimeas
### Title: Dependence Measures For Extreme Values Analysis
### Aliases: chimeas
### Keywords: htest

### ** Examples

mc <- simmc(200, alpha = 0.9)
mc2 <- simmc(100, alpha = 0.2)
##An independent case
par(mfrow = c(1,2))
chimeas(cbind(mc[1:100], mc2))
##Asymptotic dependence
par(mfrow = c(1,2))
chimeas(cbind(mc[seq(1,200, by = 2)], mc[seq(2,200,by = 2)]))
##The same but with bootstrap ci
par(mfrow = c(1,2))
chimeas(cbind(mc[seq(1,200, by = 2)], mc[seq(2,200,by = 2)]), boot =
TRUE, n.boot=50)



