library(BSDA)


### Name: Moisture
### Title: Moisture content and depth of core sample for marine muds in
###   eastern Louisiana
### Aliases: Moisture
### Keywords: datasets

### ** Examples


plot(moisture ~ depth, data = Moisture)
model <- lm(moisture ~ depth, data = Moisture)
abline(model, col = "red")
plot(resid(model) ~ depth, data = Moisture)
rm(model)




