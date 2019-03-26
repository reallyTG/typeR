library(PSAgraphics)


### Name: cat.psa
### Title: Compare balance graphically of a categorical covariate as part
###   of a PSA
### Aliases: cat.psa
### Keywords: hplot htest

### ** Examples

categorical<-sample(1:7,1000,replace=TRUE)
treatment<-sample(c(0,1),1000,replace=TRUE)
strata<-sample(5,1000,replace=TRUE)
cat.psa(categorical,treatment,strata)

data(lindner)
attach(lindner)
lindner.ps <- glm(abcix ~ stent + height + female + 
      diabetic + acutemi + ejecfrac + ves1proc, 
      data = lindner, family = binomial)
ps<-lindner.ps$fitted
lindner.s5 <- as.numeric(cut(ps, quantile(ps, seq(0, 1, 1/5)),
      include.lowest = TRUE, labels = FALSE))
cat.psa(stent, abcix, lindner.s5, xlab = "stent")

lindner.s10 <- as.numeric(cut(ps, quantile(ps, seq(0, 1, 1/10)),
      include.lowest = TRUE, labels = FALSE))
cat.psa(ves1proc,abcix, lindner.s10, balance = TRUE, xlab = "ves1proc")

#Using a rpart tree for strata
library(rpart)
lindner.rpart<-rpart(abcix ~ stent + height + female + diabetic + 
      acutemi + ejecfrac + ves1proc, data=lindner, method="class")
lindner.tree<-factor(lindner.rpart$where, labels = 1:6)
cat.psa(stent, abcix, lindner.tree, xlab = "stent")
cat.psa(ves1proc, abcix, lindner.tree, xlab = "ves1proc")



