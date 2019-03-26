library(BSDA)


### Name: Saving
### Title: Problem asset ration for savings and loan companies in
###   California, New York, and Texas
### Aliases: Saving
### Keywords: datasets

### ** Examples


boxplot(par ~ state, data = Saving, col = "red")
boxplot(par ~ state, data = Saving, log = "y", col = "red")
model <- aov(par ~ state, data = Saving)
summary(model)
plot(TukeyHSD(model))
kruskal.test(par ~ factor(state), data = Saving)




