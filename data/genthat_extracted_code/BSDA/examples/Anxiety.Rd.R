library(BSDA)


### Name: Anxiety
### Title: Math test scores versus anxiety scores before the test
### Aliases: Anxiety
### Keywords: datasets

### ** Examples


plot(math ~ anxiety, data = Anxiety, ylab = "score",
     main = "Exercise 2.96")
with(data = Anxiety,
cor(math, anxiety)
)
linmod <- lm(math ~ anxiety, data = Anxiety)
abline(linmod, col = "purple")
summary(linmod)




