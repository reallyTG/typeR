library(BSDA)


### Name: Readiq
### Title: Reading scores versus IQ scores
### Aliases: Readiq
### Keywords: datasets

### ** Examples


plot(reading ~ iq, data = Readiq)
model <- lm(reading ~ iq, data = Readiq)
abline(model, col = "purple")
predict(model, newdata = data.frame(iq = c(100, 120)))
residuals(model)[c(6, 7)]
rm(model)




