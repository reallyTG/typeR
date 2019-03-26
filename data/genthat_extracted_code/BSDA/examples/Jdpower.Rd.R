library(BSDA)


### Name: Jdpower
### Title: Number of problems reported per 100 cars in 1994 versus 1995s
### Aliases: Jdpower
### Keywords: datasets

### ** Examples


model <- lm(`1995` ~ `1994`, data = Jdpower)
summary(model)
plot(`1995` ~ `1994`, data = Jdpower)
abline(model, col = "red")
rm(model)




