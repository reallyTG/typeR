library(mratios)


### Name: AP
### Title: Angina pectoris data
### Aliases: AP
### Keywords: datasets

### ** Examples


library(mratios)

data(AP)

str(AP)

boxplot(prepost ~ treatment, data=AP)
by(AP,AP$treatment, function(x){mean(x$prepost)})
by(AP,AP$treatment, function(x){sd(x$prepost)})




