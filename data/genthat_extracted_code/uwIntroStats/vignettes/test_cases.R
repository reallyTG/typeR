## ----echo = FALSE, include = FALSE---------------------------------------
incCount <- function(inObj, useName) {
    nObj <- length(inObj)
    useNum <- max(inObj) + 1
    inObj <- c(inObj, useNum)
    names(inObj)[nObj + 1] <- useName
    inObj
}
figCount <- c(`_` = 0)
tableCount <- c(`_` = 0)

pasteLabel <- function(preText, inObj, objName, insLink = TRUE) {
    objNum <- inObj[objName]

    useText <- paste(preText, objNum, sep = " ")
    if (insLink) {
        useText <- paste("[", useText, "](#", objName, ")", sep = "")
    }
    useText
}

## ----eval = FALSE--------------------------------------------------------
#  install.packages("uwIntroStats")

## ------------------------------------------------------------------------
library(Exact)
library(geepack)
library(plyr)
library(sandwich)
library(survival)
library(uwIntroStats)

## ------------------------------------------------------------------------
data(mri)

## ------------------------------------------------------------------------
descrip(mri)

## ------------------------------------------------------------------------
descrip(mri$age, strata = mri$male)

## Call the summary function, to compare
summary(mri$age)

## ------------------------------------------------------------------------
descrip(mri$age, strata = mri$male, subset = mri$age > 75)

## ----echo = FALSE--------------------------------------------------------
tableCount <- incCount(tableCount, "stattable")

## ------------------------------------------------------------------------
tableStat(mri$age, stat = "N: @count@; Mean (SD): @mean@ (@sd@); Range: @max@ - @min@")

## ------------------------------------------------------------------------
tableStat(mri$age, strata = mri$male, stat = "N: @count@; Mean (SD): @mean@ (@sd@); Range: @min@ - @max@")

## ------------------------------------------------------------------------
tabulate(mri$age, mri$male)

## ------------------------------------------------------------------------
tabulate(mri$male, mri$chf, dispRatios = TRUE)

## ------------------------------------------------------------------------
## Base R boxplot
boxplot(mri$age ~ mri$diabetes)

## ------------------------------------------------------------------------
## Our version of boxplot
bplot(mri$age, mri$diabetes)

## ------------------------------------------------------------------------
bplot(mri$age, mri$diabetes, strata = mri$race)

## ------------------------------------------------------------------------
plot(mri$age, mri$atrophy)

## ------------------------------------------------------------------------
scatter(mri$atrophy, mri$age)

## ----echo = FALSE--------------------------------------------------------
figCount <- incCount(figCount, "stratscatter")

## ------------------------------------------------------------------------
scatter(mri$atrophy, mri$age, strata = mri$race)

## ------------------------------------------------------------------------
dummy.race <- dummy(mri$race)
head(dummy.race, n = 10)

## ------------------------------------------------------------------------
lspline.ldl <- lspline(mri$ldl, knots = c(70, 150))
head(lspline.ldl, n = 10)
lsplineD.ldl <- lsplineD(mri$ldl, knots = c(70, 150))
head(lsplineD.ldl, n = 10)

## ------------------------------------------------------------------------
age.parabola <- polynomial(mri$age, degree = 2)
head(age.parabola, n = 10)

## ------------------------------------------------------------------------
## Base R - returns only one number!
cor(mri$male, mri$diabetes)

## uwIntroStats version
correlate(mri$male, mri$diabetes)

## Stratify on race
correlate(mri$male, mri$diabetes, strata = mri$race)

## ------------------------------------------------------------------------
## base R
t.test(mri$ldl, mu = 125)
## uwIntroStats
ttest(mri$ldl, null.hypoth = 125)

## ------------------------------------------------------------------------
## base R
t.test(mri$ldl[mri$male == 0], mri$ldl[mri$male == 1])

## uwIntroStats
ttest(mri$ldl, by = mri$male)

## ------------------------------------------------------------------------
## base R
t.test(mri$ldl, mu = 125)

## ttest
ttest(mri$ldl, null.hypoth = 125)

## oneSample
oneSample("mean", mri$ldl, null.hypothesis = 125)

## ------------------------------------------------------------------------
## base R
t.test(log(mri$ldl), mu = log(125))

## ttest
ttest(log(mri$ldl), null.hypoth = log(125))

## oneSample
oneSample("geometric mean", mri$ldl, null.hypothesis = 125)

## ------------------------------------------------------------------------
## base R
binom.test(sum(mri$ldl > 128, na.rm = TRUE), n = sum(!is.na(mri$ldl)))

## oneSample
oneSample("prop", mri$ldl > 128, null.hypothesis = 0.5)
oneSample("prop", mri$ldl, above = 128, null.hypothesis = 0.5)

## ------------------------------------------------------------------------
## create the data
cf <- c(1153, 1132, 1165, 1460, 1162, 1493, 1358, 1453, 1185, 1824, 1793, 1930, 2075)
healthy <- c(996, 1080, 1182, 1452, 1634, 1619, 1140, 1123, 1113, 1463, 1632, 1614, 1836)

## base R
wilcox.test(healthy, cf, paired = TRUE)

## uwIntroStats
wilcoxon(cf, healthy, paired = TRUE)

## ----echo = FALSE--------------------------------------------------------
tableCount <- incCount(tableCount, "fnctl")

## ------------------------------------------------------------------------
## base R
summary(lm(atrophy ~ age, data = mri))
## uwIntroStats
regress("mean", atrophy ~ age, data = mri)

## ------------------------------------------------------------------------
regress("geom", ldl ~ age, data = mri)

## ------------------------------------------------------------------------
## transform the ldl variable
logldl <- log(mri$ldl)
## create the model
mod <- lm(logldl ~ age, data = mri)
## view the coefficients (untransformed)
summary(mod)
## back-transform the coefficients and CI
mod.sum <- summary(mod)
## this gives the coefficients
exp(mod.sum$coefficients[,1])
## this gives the CI
exp(mod.sum$coefficients[,1] - 1.96*mod.sum$coefficients[,2])
exp(mod.sum$coefficients[,1] + 1.96*mod.sum$coefficients[,2])

## ------------------------------------------------------------------------
salary <- read.table("http://www.emersonstatistics.com/datasets/salary.txt", header = TRUE, stringsAsFactors = FALSE)
salary$female <- ifelse(salary$sex == "F", 1, 0)

## ------------------------------------------------------------------------
## adjusting for correlated data
regress("mean",salary ~ female*year, id = id, data = salary)
## without adjusting
regress("mean", salary ~ female*year, data = salary)

## ------------------------------------------------------------------------
regress("mean", atrophy ~ dummy(race), data = mri)

## ----echo = FALSE--------------------------------------------------------
attach(mri)

## ----eval = FALSE--------------------------------------------------------
#  U(~age + male)

## ----echo = FALSE--------------------------------------------------------
detach(mri)

## ------------------------------------------------------------------------
regress("mean", atrophy ~ dummy(race) + U(~age + male), data = mri)

## ------------------------------------------------------------------------
regress("mean", atrophy ~ dummy(race) + U(ma = ~age + male), data = mri)

## ------------------------------------------------------------------------
## get the model
mod <- regress("mean", atrophy ~ dummy(race) + age + male, data = mri)

## get the test of age and male
lincom(mod, comb = c(0,0,0,0,1,1))

## ------------------------------------------------------------------------
lincom(mod, comb = c(0,0,0,0,1,2))

## ------------------------------------------------------------------------
set.seed(47)
samp <- sample(1:nrow(mri), nrow(mri)/2, replace = FALSE)
mri.train <- mri[samp, ]
mri.test <- mri[-samp,]

modlm <- lm(atrophy ~ age + male + dummy(race), data = mri.train)
modreg <- regress("mean", atrophy ~ age + male + dummy(race), data = mri.train)

predslm <- predict(modlm, data = mri.test)
predsreg <- predict(modreg, data = mri.test)

head(predslm, n = 5)
head(predsreg, n = 5)

## ------------------------------------------------------------------------
ldlReg <- regress("mean", age ~ ldl, data = mri)

student.resid <- uResiduals(ldlReg, "studentized")
jack.resid <- uResiduals(ldlReg, "jackknife")

head(student.resid, n = 5)
head(jack.resid, n = 5)

