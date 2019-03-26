library(BSDA)


### Name: Coffee
### Title: Productivity of workers with and without a coffee break
### Aliases: Coffee
### Keywords: datasets

### ** Examples


qqnorm(Coffee$differences)
qqline(Coffee$differences)
shapiro.test(Coffee$differences)
t.test(Coffee$with, Coffee$without, paired = TRUE, alternative = "greater")
wilcox.test(Coffee$with, Coffee$without, paired = TRUE, 
alterantive = "greater")




