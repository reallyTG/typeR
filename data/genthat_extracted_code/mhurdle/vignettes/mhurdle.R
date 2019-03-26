### R code from vignette source 'mhurdle.rnw'

###################################################
### code chunk number 1: init
###################################################
options(prompt= "R> ", useFancyQuotes = FALSE)


###################################################
### code chunk number 2: Formula
###################################################
library("Formula")
f <- Formula(y ~ x11 + x12  | x21 + x22 | x31 + x32)


###################################################
### code chunk number 3: Library
###################################################
library("mhurdle")


###################################################
### code chunk number 4: Data
###################################################
data("Interview", package = "mhurdle")
head(Interview, 3)
mean(Interview$shows == 0)
max(Interview$shows)


###################################################
### code chunk number 5: onequation
###################################################
Sn <- mhurdle(vacations ~ 0 | I(car > 0) + size + linc + linc2 + age + age2,
              Interview, dist = "n", h2 = TRUE, corr = FALSE,
              method = "bhhh", print.level = 0)
Sbc <- update(Sn, dist = "bc")
Sln <- update(Sn, dist = "ln")
library(texreg)


###################################################
### code chunk number 6: mhurdle.rnw:2229-2233 (eval = FALSE)
###################################################
## texreg(list(Sn, Sbc, Sln), 
##        custom.model.names = c("normal tobit", "log-normal tobit", "box-cox tobit"), 
##        caption = "Estimation of one-equation models", 
##        label = "tab:oneq", pos = "ht")


###################################################
### code chunk number 7: mhurdle.rnw:2236-2240
###################################################
texreg(list(Sn, Sbc, Sln), 
       custom.model.names = c("normal tobit", "log-normal tobit", "box-cox tobit"), 
       caption = "Estimation of one-equation models", 
       label = "tab:oneq", pos = "ht")


###################################################
### code chunk number 8: selection
###################################################
Stn <- mhurdle(foodaway ~ size + smsa + age + age2 | linc + linc2, Interview, 
               dist = "n", h2 = FALSE, corr = FALSE, method = "bhhh", print.level = 0)
Sbc <- update(Stn, dist = "bc")
Sln <- update(Stn, dist = "ln")


###################################################
### code chunk number 9: mhurdle.rnw:2273-2275
###################################################
Slnd <- update(Sln, corr = TRUE)
coef(summary(Slnd), "corr")


###################################################
### code chunk number 10: mhurdle.rnw:2283-2287 (eval = FALSE)
###################################################
## texreg(list(Stn, Sln, Sbc), 
##        custom.model.names = c("truncated-normal", "log-normal", "box-cox"), 
##        caption = "Estimation of single hurdle selection models", 
##        label = "tab:sep", pos = "ht")


###################################################
### code chunk number 11: mhurdle.rnw:2291-2295
###################################################
texreg(list(Stn, Sln, Sbc), 
       custom.model.names = c("truncated-normal", "log-normal", "box-cox"), 
       caption = "Estimation of single hurdle selection models", 
       label = "tab:sep", pos = "ht")


###################################################
### code chunk number 12: ptobit
###################################################
ptobit <- mhurdle(apparel ~ 0 | linc + linc2 | factor(month) + smsa,
                  Interview, corr = TRUE, dist = "ln", h2 = FALSE,
                  method = "bhhh")


###################################################
### code chunk number 13: ThreeHurdlesDep
###################################################
H3D <- mhurdle(shows ~ educ + size | linc + linc2 | age + age2 + smsa, 
               Interview, dist = "ln", h2 = TRUE, corr = TRUE, method = "bhhh")


###################################################
### code chunk number 14: ThreeHurdlesInd
###################################################
H3I <- update(H3D, corr = FALSE)


###################################################
### code chunk number 15: TwoHurdlesThreeEqs
###################################################
H2D <- update(H3D, h2 = FALSE)


###################################################
### code chunk number 16: Selection
###################################################
S2D <- mhurdle(shows ~ educ + size + age + age2 + smsa | linc + linc2, 
               Interview, dist = "ln", h2 = TRUE, corr = TRUE, method = "bhhh")


###################################################
### code chunk number 17: Ptobit
###################################################
P2D <- mhurdle(shows ~ 0 | linc + linc2 | educ + size + age + age2 + smsa, 
               Interview, dist = "ln", h2 = TRUE, corr = TRUE, method = "bhhh")


###################################################
### code chunk number 18: Summary
###################################################
summary(H3D)


###################################################
### code chunk number 19: Methods
###################################################
coef(H3D, "h2")
coef(H3D, "h1")
coef(H3D, "sd")
coef(summary(H3D), "h3")
vcov(H3D, "h3")


###################################################
### code chunk number 20: LogLik
###################################################
logLik(H3D)
logLik(H3D, naive = TRUE)


###################################################
### code chunk number 21: Fitted (eval = FALSE)
###################################################
## head(fitted(H3D))


###################################################
### code chunk number 22: Predict (eval = FALSE)
###################################################
## predict(H3D,
##         newdata = data.frame(
##             comics = c(0, 1, 2),
##             gender = c("female", "female", "male"),
##             age = c(20, 18, 32),
##             educ = c(10, 20, 5),
##             incum = c(4, 8, 2),
##             size = c(2, 1, 3)))


###################################################
### code chunk number 23: Rsq1 (eval = FALSE)
###################################################
## rsq(H3D, type = "coefdet")


###################################################
### code chunk number 24: Rsq2
###################################################
rsq(H3D, type = "lratio", adj = TRUE)


###################################################
### code chunk number 25: VuongUnnested
###################################################
vuongtest(S2D, P2D)


###################################################
### code chunk number 26: VuongNested
###################################################
vuongtest(H3D, H3I, type = 'nested', hyp = TRUE)
vuongtest(H3D, H3I, type = 'nested', hyp = FALSE)


###################################################
### code chunk number 27: SelectionBis
###################################################
S2Db <- mhurdle(shows ~ educ + size + sex + smsa | linc + linc2, 
                Interview, dist = "ln", h2 = TRUE, corr = TRUE, method = "bhhh")


###################################################
### code chunk number 28: VuongOverlap
###################################################
vuongtest(S2D, S2Db, type="overlapping")


###################################################
### code chunk number 29: VuongOverlap2
###################################################
vuongtest(S2D, S2Db, type="overlapping", hyp=TRUE)


