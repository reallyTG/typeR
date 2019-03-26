library(BSDA)


### Name: Nicotine
### Title: Nicotine content versus sales for eight major brands of
###   cigarettes
### Aliases: Nicotine
### Keywords: datasets

### ** Examples


model <- lm(sales ~ nicotine, data = Nicotine)
plot(sales ~ nicotine, data = Nicotine)
abline(model, col = "red")
summary(model)
predict(model, newdata = data.frame(nicotine = 1), 
        interval = "confidence", level = 0.99)




