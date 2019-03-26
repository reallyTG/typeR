library(BSDA)


### Name: Engineer
### Title: Salaries after 10 years for graduates of three different
###   universities
### Aliases: Engineer
### Keywords: datasets

### ** Examples


boxplot(salary ~ university, data = Engineer,
        main = "Example 10.7", col = "yellow")
kruskal.test(salary ~ university, data = Engineer)
anova(lm(salary ~ university, data = Engineer))
anova(lm(rank(salary) ~ university, data = Engineer))




