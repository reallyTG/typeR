library(BSDA)


### Name: Archaeo
### Title: Radiocarbon ages of observations taken from an archaeological
###   site
### Aliases: Archaeo
### Keywords: datasets

### ** Examples


boxplot(age ~ phase, data = Archaeo, col = "yellow", 
        main = "Example 1.16", xlab = "Ceramic Phase", ylab = "Age")
anova(lm(age ~ as.factor(phase), data= Archaeo))




