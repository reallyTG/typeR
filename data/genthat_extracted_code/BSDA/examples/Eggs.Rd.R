library(BSDA)


### Name: Eggs
### Title: Number of eggs versus amounts of feed supplement
### Aliases: Eggs
### Keywords: datasets

### ** Examples


plot(eggs ~ feed, data = Eggs)
model <- lm(eggs ~ feed, data = Eggs)
abline(model, col = "red")
summary(model)
rm(model)




