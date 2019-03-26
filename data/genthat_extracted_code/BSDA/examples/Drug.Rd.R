library(BSDA)


### Name: Drug
### Title: Number of trials to master a task for a group of 28 subjects
###   assigned to a control and an experimental group
### Aliases: Drug
### Keywords: datasets

### ** Examples


boxplot(trials ~ group, data = Drug,
        main = "Example 7.15", col = c("yellow", "red"))
wilcox.test(trials ~ group, data = Drug)
t.test(rank(trials) ~ group, data = Drug, var.equal = TRUE)




