library(BSDA)


### Name: Corn
### Title: Comparison of the yields of a new variety and a standard variety
###   of corn planted on 12 plots of land
### Aliases: Corn
### Keywords: datasets

### ** Examples


boxplot(Corn$differences)
qqnorm(Corn$differences)
qqline(Corn$differences)
shapiro.test(Corn$differences)
t.test(Corn$new, Corn$standard, paired = TRUE, alternative = "greater")




