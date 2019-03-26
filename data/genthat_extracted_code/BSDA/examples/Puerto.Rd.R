library(BSDA)


### Name: Puerto
### Title: Weekly incomes of a random sample of 50 Puerto Rican families in
###   Miami
### Aliases: Puerto
### Keywords: datasets

### ** Examples


stem(Puerto$income)
boxplot(Puerto$income, col = "purple")
t.test(Puerto$income,conf.level = .90)$conf




