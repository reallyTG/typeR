library(BSDA)


### Name: Adsales
### Title: Number of ads versus number of sales for a retailer of satellite
###   dishes
### Aliases: Adsales
### Keywords: datasets

### ** Examples


plot(sales ~ ads, data = Adsales, main = "Exercise 9.15")
mod <- lm(sales ~ ads, data = Adsales)
abline(mod, col = "red")
summary(mod)
predict(mod, newdata = data.frame(ads = 6), interval = "conf", level = 0.99)




