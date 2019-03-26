library(robustbase)


### Name: starsCYG
### Title: Hertzsprung-Russell Diagram Data of Star Cluster CYG OB1
### Aliases: starsCYG
### Keywords: datasets

### ** Examples

data(starsCYG)
plot(starsCYG)
cst <- covMcd(starsCYG)
lm.stars <- lm(log.light ~ log.Te, data = starsCYG)
summary(lm.stars)
plot(lm.stars)
lts.stars <- ltsReg(log.light ~ log.Te, data = starsCYG)
plot(lts.stars)



