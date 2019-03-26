library(psych)


### Name: print.psych
### Title: Print and summary functions for the psych class
### Aliases: print.psych summary.psych anova.psych
### Keywords: multivariate

### ** Examples

data(bfi)
 keys.list <- list(agree=c(-1,2:5),conscientious=c(6:8,-9,-10),
 extraversion=c(-11,-12,13:15),neuroticism=c(16:20),openness = c(21,-22,23,24,-25))
 keys <- make.keys(25,keys.list,item.labels=colnames(bfi[1:25]))
 scores <- score.items(keys,bfi[1:25])
 scores
 summary(scores)



