### R code from vignette source 'pim.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: pim.Rnw:102-103
###################################################
options(width=82)


###################################################
### code chunk number 2: pim.Rnw:110-113
###################################################
library("pim")
data(FEVData)
head(FEVData)


###################################################
### code chunk number 3: pim.Rnw:123-124
###################################################
pim1 <- pim(formula = FEV ~ Age + Smoke, data = FEVData)


###################################################
### code chunk number 4: pim.Rnw:129-130
###################################################
coef(pim1)


###################################################
### code chunk number 5: pim.Rnw:133-134
###################################################
summary(pim1)


###################################################
### code chunk number 6: pim.Rnw:146-148
###################################################
pim2 <- pim(FEV ~ Age*Smoke, data = FEVData)
summary(pim2)


###################################################
### code chunk number 7: pim.Rnw:170-172
###################################################
data(EngelData)
head(EngelData)


###################################################
### code chunk number 8: pim.Rnw:177-179
###################################################
par(cex = 0.4)
plot(foodexp~income, data = EngelData)


###################################################
### code chunk number 9: pim.Rnw:198-202
###################################################
names(EngelData) <- c("HI", "FE")
form <- FE ~ I( (R(HI) - L(HI))/sqrt(R(HI) + L(HI)) )
pim3 <- pim(formula = form, data = EngelData)
coef(pim3)				


###################################################
### code chunk number 10: pim.Rnw:234-237
###################################################
id.nonsmokers <- which(FEVData$Smoke == 0)
id.smokers <- which(FEVData$Smoke == 1)
compare <- expand.grid(id.nonsmokers, id.smokers)


###################################################
### code chunk number 11: pim.Rnw:240-242
###################################################
pim4 <- pim(formula = FEV ~ +1 + Age, data = FEVData, compare = compare)
summary(pim4)


###################################################
### code chunk number 12: pim.Rnw:279-284
###################################################
data(ChickWeight)
Data <- subset(ChickWeight, Time == 6)[,-2]
Data$baseline <- subset(ChickWeight, Time == 0)$weight[
is.element(subset(ChickWeight, Time == 0)$Chick, Data$Chick)]
head(Data)


###################################################
### code chunk number 13: pim.Rnw:287-292
###################################################
pim.score <- pim(formula = weight ~ R(Diet) - 1, data = Data,
                 compare = "all", 
                 link = "identity",
                 vcov.estim = score.vcov)
summary(pim.score)


###################################################
### code chunk number 14: pim.Rnw:297-299
###################################################
z.score <- (coef(pim.score) - 0.5)/sqrt(diag(vcov(pim.score)))
1 - pchisq(z.score^2, 1)


###################################################
### code chunk number 15: pim.Rnw:303-306
###################################################
library(MASS)
t(coef(pim.score) - 0.5)%*%ginv(vcov(pim.score))%*%c(coef(pim.score) - 0.5)
kruskal.test(weight ~ Diet, data = Data)$stat


###################################################
### code chunk number 16: pim.Rnw:309-314
###################################################
pim.wald <- pim(formula = weight ~ R(Diet) - 1, data = Data,
                 compare = "all", 
                 link = "identity",
                 vcov.estim = sandwich.vcov)
t(coef(pim.wald) - 0.5)%*%ginv(vcov(pim.wald))%*%c(coef(pim.wald) - 0.5)


###################################################
### code chunk number 17: pim.Rnw:326-332
###################################################
Data$Diet <- factor(Data$Diet, ordered = TRUE)
JT.formula <- weight ~ I((L(Diet) < R(Diet)) - (L(Diet) > R(Diet))) + 1
pim.JT <- pim(formula = JT.formula, data = Data, 
              link = "identity", vcov.estim = score.vcov,
              compare = "all")
summary(pim.JT)


###################################################
### code chunk number 18: pim.Rnw:353-367
###################################################
# modify data for the sake of illustration
wb <- aggregate(warpbreaks$breaks,
                by = list(w = warpbreaks$wool,
                          t = warpbreaks$tension),
                FUN = mean)
colnames(wb) = c("wool", "tension", "breaks")         
# all possible comparisons       
comp <- expand.grid(1:nrow(wb), 1:nrow(wb))
# restrict comparisons within block
compare <- comp[wb$tension[comp[,1]] == wb$tension[comp[,2]],] 
pim.F <- pim(breaks ~ wool, data = wb, compare = compare, 
link = "identity",  vcov.estim = score.vcov)
summary(pim.F)
friedman.test(breaks ~ wool | tension, data = wb)


