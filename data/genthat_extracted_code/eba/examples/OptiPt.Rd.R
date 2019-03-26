library(eba)


### Name: eba
### Title: Elimination-by-Aspects (EBA) Models
### Aliases: OptiPt eba summary.eba anova.eba vcov.eba print.summary.eba
###   print.eba L L.constrained deviance.eba
### Keywords: models

### ** Examples

data(celebrities)                     # absolute choice frequencies
btl1 <- eba(celebrities)              # fit Bradley-Terry-Luce model
A <- list(c(1,10), c(2,10), c(3,10),
          c(4,11), c(5,11), c(6,11),
          c(7,12), c(8,12), c(9,12))  # the structure of aspects
eba1 <- eba(celebrities, A)           # fit elimination-by-aspects model

summary(eba1)                         # goodness of fit
plot(eba1)                            # residuals versus predicted values
anova(btl1, eba1)                     # model comparison based on likelihoods
confint(eba1)                         # confidence intervals for parameters
uscale(eba1)                          # utility scale

ci <- 1.96 * sqrt(diag(cov.u(eba1)))      # 95% CI for utility scale values
dotchart(uscale(eba1), xlim=c(0, .3), main="Choice among celebrities",
         xlab="Utility scale value (EBA model)", pch=16)    # plot the scale
arrows(uscale(eba1)-ci, 1:9, uscale(eba1)+ci, 1:9, .05, 90, 3)  # error bars
abline(v=1/9, lty=2)                      # indifference line
mtext("(Rumelhart and Greeno, 1971)", line=.5)



