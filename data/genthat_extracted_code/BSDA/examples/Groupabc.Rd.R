library(BSDA)


### Name: Groupabc
### Title: Group data to illustrate analysis of variance
### Aliases: Groupabc
### Keywords: datasets

### ** Examples


boxplot(response ~ group, data = Groupabc, 
        col = c("red", "blue", "green"))
        anova(lm(response ~ group, data = Groupabc))




