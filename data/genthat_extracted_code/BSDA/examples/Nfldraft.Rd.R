library(BSDA)


### Name: Nfldraft
### Title: Rating, time in 40-yard dash, and weight of top offensive
###   linemen in the 1994 NFL draft
### Aliases: Nfldraft
### Keywords: datasets

### ** Examples


plot(rating ~ forty, data = Nfldraft)
cor(Nfldraft$rating, Nfldraft$forty)
summary(lm(rating ~ forty, data = Nfldraft))




