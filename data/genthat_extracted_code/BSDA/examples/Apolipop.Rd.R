library(BSDA)


### Name: Apolipop
### Title: Level of apolipoprotein B and number of cups of coffee consumed
###   per day for 15 adult males
### Aliases: Apolipop
### Keywords: datasets

### ** Examples


plot(apolipB ~ coffee, data = Apolipop)
linmod <- lm(apolipB ~ coffee, data = Apolipop)
summary(linmod)
summary(linmod)$sigma
anova(linmod)
anova(linmod)[2, 3]^.5
par(mfrow = c(2, 2))
plot(linmod)
par(mfrow = c(1, 1))




