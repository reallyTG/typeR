library(BSDA)


### Name: Nervous
### Title: Reaction effects of 4 drugs on 25 subjects with a nervous
###   disorder
### Aliases: Nervous
### Keywords: datasets

### ** Examples


boxplot(react ~ drug, data = Nervous, col = rainbow(4))
model <- aov(react ~ factor(drug), data = Nervous)
summary(model)
TukeyHSD(model)
plot(TukeyHSD(model), las = 1)




