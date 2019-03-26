library(gtx)


### Name: bp.scores
### Title: Genetic risk scores for blood pressure.
### Aliases: bp.scores
### Keywords: datasets

### ** Examples

data(bp.scores)
head(subset(bp.scores, score == "SBP2011A"))
sbp <- subset(bp.scores, score == "SBP2011A")
dbp <- subset(bp.scores, score == "DBP2011A")
dbp <- dbp[match(sbp$locus, dbp$locus), ]
plot(sbp$coef/sign(sbp$coef), dbp$coef/sign(sbp$coef),
     xlim = c(0, max(sbp$coef/sign(sbp$coef))),
     ylim = c(0, max(dbp$coef/sign(sbp$coef))),
     xlab = "SBP effect [mmHg]", ylab = "DBP effect [mmHg]",
     las = 1)



