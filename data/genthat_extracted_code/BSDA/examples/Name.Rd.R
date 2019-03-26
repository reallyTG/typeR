library(BSDA)


### Name: Name
### Title: Estimated value of a brand name product and the conpany's
###   revenue
### Aliases: Name
### Keywords: datasets

### ** Examples


plot(value ~ revenue, data = Name)
model <- lm(value ~ revenue, data = Name)
abline(model, col = "red")
cor(Name$value, Name$revenue)
summary(model)
rm(model)




