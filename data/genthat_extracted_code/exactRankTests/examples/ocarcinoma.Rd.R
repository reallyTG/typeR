library(exactRankTests)


### Name: ocarcinoma
### Title: Ovarian Carcinoma
### Aliases: ocarcinoma
### Keywords: datasets

### ** Examples


data(ocarcinoma)
attach(ocarcinoma)
# compute integer valued logrank scores
logrsc <- cscores.Surv(cbind(time, cens), int=TRUE)
# the test statistic
lgT <- sum(logrsc[stadium == "II"])
# p-value
round(pperm(lgT, logrsc, m=sum(stadium=="II"), al="tw"), 4)

# compute logrank scores and simulate p-value
logrsc <- cscores.Surv(cbind(time, cens), int=FALSE)
# the test statistic
lgT <- sum(logrsc[stadium == "II"])
# p-value
round(pperm(lgT, logrsc, m=sum(stadium=="II"), al="tw", simulate=TRUE), 4)




