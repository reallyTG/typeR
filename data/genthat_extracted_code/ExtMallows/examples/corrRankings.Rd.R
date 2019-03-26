library(ExtMallows)


### Name: corrRankings
### Title: p value for measuring the correlation of pairwise rankings
### Aliases: corrRankings

### ** Examples


data(simu3)
pvalue=corrRankings(rankings = simu3)

#threshold the p values

threshold=0.05
pvalue.trunc=ifelse(pvalue<=0.05, pvalue, 1)

#plot the p values

x=y=1:ncol(pvalue)
par(mfrow=c(1,2))
image(x, y, pvalue, xlab = NA, ylab = NA, sub = "rank coefficient")
image(x, y, pvalue.trunc, xlab = NA, ylab = NA, sub = "rank coefficient < 0.05")




