library(DescTools)


### Name: OddsRatio
### Title: Odds Ratio Estimation and Confidence Intervals
### Aliases: OddsRatio OddsRatio.glm OddsRatio.multinom OddsRatio.zeroinfl
###   OddsRatio.default
### Keywords: models multivar

### ** Examples

# Case-control study assessing whether exposure to tap water
#   is associated with cryptosporidiosis among AIDS patients

tab <- matrix(c(2, 29, 35, 64, 12, 6), 3, 2, byrow=TRUE)
dimnames(tab) <- list("Tap water exposure" = c("Lowest", "Intermediate", "Highest"),
                      "Outcome" = c("Case", "Control"))
tab <- Rev(tab, direction="column")

OddsRatio(tab[1:2,])
OddsRatio(tab[c(1,3),])

OddsRatio(tab[1:2,], method="mle")
OddsRatio(tab[1:2,], method="midp")
OddsRatio(tab[1:2,], method="wald", conf.level=0.95)

# in case of zeros consider using glm for calculating OR
dp <- data.frame (a=c(20, 7, 0, 0), b=c(0, 0, 0, 12), t=c(1, 0, 1, 0))
fit <- glm(cbind(a, b) ~ t, data=dp, family=binomial)

exp(coef(fit))

# calculation of log oddsratios in a 2x2xk table
migraine <- xtabs(freq ~ .,
                  cbind(expand.grid(treatment=c("active","placebo"),
                                    response=c("better","same"),
                                    gender=c("female","male")),
                        freq=c(16,5,11,20,12,7,16,19))
)

log(apply(migraine, 3, OddsRatio))

# OddsRatio table for logistic regression models
r.glm <- glm(type ~ ., data=MASS::Pima.tr2, family=binomial)
OddsRatio(r.glm)

plot(OddsRatio(r.glm), xlim=c(0.5, 2), main="OddsRatio - glm", pch=NA,
     lblcolor=hred, args.errbars=list(col=horange, pch=21, col.pch=hblue,
     bg.pch=hyellow, cex.pch=1.5))



