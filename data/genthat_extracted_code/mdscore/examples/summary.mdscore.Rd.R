library(mdscore)


### Name: summary.mdscore
### Title: Summary methods for mdscore objects
### Aliases: summary.mdscore
### Keywords: mdscore score glm

### ** Examples

library(Sleuth3)
d <- transform(case1102, TLrat = Brain/Liver, Ltime = log(Time),
               Lwrat = log((Weight + Loss)/Weight),
               Treat = factor(Treatment == "BD", 
               labels=c("NS", "BD"))
               )
fitf <- glm(TLrat ~ Ltime * Treat + Days + Sex + Lwrat
            + Tumor + Treat*Lwrat, data = d,
            family = Gamma("log")
            )
X <- model.matrix(fitf)
fit0 <- glm(TLrat ~ Ltime * Treat + Sex + Lwrat + Tumor + Days,
            data=d, family=Gamma("log"))
test <- mdscore(fit0, X1=X[,9], phi=NULL)
summary(test)



