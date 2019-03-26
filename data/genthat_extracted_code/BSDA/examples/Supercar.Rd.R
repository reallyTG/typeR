library(BSDA)


### Name: Supercar
### Title: Top speeds attained by five makes of supercars
### Aliases: Supercar
### Keywords: datasets

### ** Examples


boxplot(speed ~ car, data = Supercar, col = rainbow(6),
        ylab = "Speed (mph)")
summary(aov(speed ~ car, data = Supercar))
anova(lm(speed ~ car, data = Supercar))




