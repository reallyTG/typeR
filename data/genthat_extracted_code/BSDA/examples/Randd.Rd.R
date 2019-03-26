library(BSDA)


### Name: Randd
### Title: Research and development expenditures and sales of a large
###   company
### Aliases: Randd
### Keywords: datasets

### ** Examples


plot(sales ~ rd, data = Randd)
model <- lm(sales ~ rd, data = Randd)
abline(model, col = "purple")
summary(model)
plot(model, which = 1)
rm(model)




