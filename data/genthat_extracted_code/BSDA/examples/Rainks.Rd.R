library(BSDA)


### Name: Rainks
### Title: Rainfall in an area of west central Kansas and four surrounding
###   counties
### Aliases: Rainks
### Keywords: datasets

### ** Examples


cor(Rainks)
model <- lm(rain ~ x2, data = Rainks)
summary(model)




