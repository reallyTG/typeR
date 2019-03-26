library(CAMAN)


### Name: betaplasma
### Title: Determinants of Beta-Carotene Levels
### Aliases: betaplasma
### Keywords: datasets

### ** Examples

data(betaplasma)
beta4 <- mixcov(dep="betacaro", fixed=c("chol","sex","bmi"), random="betadiet",
                data=betaplasma,k=4,family="gaussian")




