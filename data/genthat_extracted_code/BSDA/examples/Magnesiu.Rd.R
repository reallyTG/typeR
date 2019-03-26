library(BSDA)


### Name: Magnesiu
### Title: Magnesium concentration and distances between samples
### Aliases: Magnesiu
### Keywords: datasets

### ** Examples


plot(magnesium ~ distance, data = Magnesiu)
model = lm(magnesium ~ distance, data = Magnesiu)
abline(model, col = "red")
summary(model)
rm(model)




