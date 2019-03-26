library(BSDA)


### Name: Register
### Title: Maintenance cost versus age of cash registers in a department
###   store
### Aliases: Register
### Keywords: datasets

### ** Examples


plot(cost ~ age, data = Register)
model <- lm(cost ~ age, data = Register)
abline(model, col = "red")
predict(model, newdata = data.frame(age = c(5, 10)))
plot(model, which = 1)
rm(model)




