library(gginference)


### Name: ggcortest
### Title: Plot test for association between paired samples
### Aliases: ggcortest

### ** Examples


corr_test <- cor.test(iris$Sepal.Length, iris$Sepal.Width)
corr_test
ggcortest(corr_test)




