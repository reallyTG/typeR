library(DAAG)


### Name: softbacks
### Title: Measurements on a Selection of Paperback Books
### Aliases: softbacks
### Keywords: datasets

### ** Examples

print("Outliers in Simple Regression - Example 5.2")
paperback.lm <- lm(weight ~ volume, data=softbacks)
summary(paperback.lm)
plot(paperback.lm)



