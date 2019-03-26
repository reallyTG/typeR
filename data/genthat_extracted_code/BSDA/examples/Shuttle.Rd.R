library(BSDA)


### Name: Shuttle
### Title: Number of people riding shuttle versus number of automobiles in
###   the downtown area
### Aliases: Shuttle
### Keywords: datasets

### ** Examples


plot(autos ~ users, data = Shuttle)
model <- lm(autos ~ users, data = Shuttle)
summary(model)
rm(model)




