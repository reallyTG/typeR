library(AER)


### Name: StockWatson2007
### Title: Data and Examples from Stock and Watson (2007)
### Aliases: StockWatson2007
### Keywords: datasets

### ** Examples

###############################
## Current Population Survey ##
###############################

## p. 165
data("CPSSWEducation", package = "AER")
plot(earnings ~ education, data = CPSSWEducation)
fm <- lm(earnings ~ education, data = CPSSWEducation)
coeftest(fm, vcov = sandwich)
abline(fm)


############################
## California test scores ##
############################

## data and transformations
data("CASchools", package = "AER")
CASchools$stratio <- with(CASchools, students/teachers)
CASchools$score <- with(CASchools, (math + read)/2)

## p. 152
fm1 <- lm(score ~ stratio, data = CASchools)
coeftest(fm1, vcov = sandwich)

## p. 159
fm2 <- lm(score ~ I(stratio < 20), data = CASchools)
## p. 199
fm3 <- lm(score ~ stratio + english, data = CASchools)
## p. 224
fm4 <- lm(score ~ stratio + expenditure + english, data = CASchools)

## Table 7.1, p. 242 (numbers refer to columns)
fmc3 <- lm(score ~ stratio + english + lunch, data = CASchools)
fmc4 <- lm(score ~ stratio + english + calworks, data = CASchools)
fmc5 <- lm(score ~ stratio + english + lunch + calworks, data = CASchools)

## Equation 8.2, p. 258
fmquad <- lm(score ~ income + I(income^2), data = CASchools)
## Equation 8.11, p. 266
fmcub <- lm(score ~ income + I(income^2) + I(income^3), data = CASchools)
## Equation 8.23, p. 272
fmloglog <- lm(log(score) ~ log(income), data = CASchools)
## Equation 8.24, p. 274
fmloglin <- lm(log(score) ~ income, data = CASchools)
## Equation 8.26, p. 275
fmlinlogcub <- lm(score ~ log(income) + I(log(income)^2) + I(log(income)^3),
  data = CASchools)

## Table 8.3, p. 292 (numbers refer to columns)
fmc2 <- lm(score ~ stratio + english + lunch + log(income), data = CASchools)
fmc7 <- lm(score ~ stratio + I(stratio^2) + I(stratio^3) + english + lunch + log(income),
  data = CASchools)


#####################################
## Economics journal Subscriptions ##
#####################################

## data and transformed variables
data("Journals", package = "AER")
journals <- Journals[, c("subs", "price")]
journals$citeprice <- Journals$price/Journals$citations
journals$age <- 2000 - Journals$foundingyear
journals$chars <- Journals$charpp*Journals$pages/10^6

## Figure 8.9 (a) and (b)
plot(subs ~ citeprice, data = journals, pch = 19)
plot(log(subs) ~ log(citeprice), data = journals, pch = 19)
fm1 <- lm(log(subs) ~ log(citeprice), data = journals)
abline(fm1)

## Table 8.2, use HC1 for comparability with Stata 
fm1 <- lm(subs ~ citeprice, data = log(journals))
fm2 <- lm(subs ~ citeprice + age + chars, data = log(journals))
fm3 <- lm(subs ~ citeprice + I(citeprice^2) + I(citeprice^3) +
  age + I(age * citeprice) + chars, data = log(journals))
fm4 <- lm(subs ~ citeprice + age + I(age * citeprice) + chars, data = log(journals))
coeftest(fm1, vcov = vcovHC(fm1, type = "HC1"))
coeftest(fm2, vcov = vcovHC(fm2, type = "HC1"))
coeftest(fm3, vcov = vcovHC(fm3, type = "HC1"))
coeftest(fm4, vcov = vcovHC(fm4, type = "HC1"))
waldtest(fm3, fm4, vcov = vcovHC(fm3, type = "HC1"))


###############################
## Massachusetts test scores ##
###############################

## compare Massachusetts with California
data("MASchools", package = "AER")
data("CASchools", package = "AER")
CASchools$stratio <- with(CASchools, students/teachers)
CASchools$score4 <- with(CASchools, (math + read)/2)

## parts of Table 9.1, p. 330
vars <- c("score4", "stratio", "english", "lunch", "income")
cbind(
  CA_mean = sapply(CASchools[, vars], mean),
  CA_sd   = sapply(CASchools[, vars], sd),
  MA_mean = sapply(MASchools[, vars], mean),
  MA_sd   = sapply(MASchools[, vars], sd))

## Table 9.2, pp. 332--333, numbers refer to columns
MASchools$higheng <- with(MASchools, english > median(english))
fm1 <- lm(score4 ~ stratio, data = MASchools)
fm2 <- lm(score4 ~ stratio + english + lunch + log(income), data = MASchools)
fm3 <- lm(score4 ~ stratio + english + lunch + income + I(income^2) + I(income^3),
  data = MASchools)
fm4 <- lm(score4 ~ stratio + I(stratio^2) + I(stratio^3) + english + lunch +
  income + I(income^2) + I(income^3), data = MASchools)
fm5 <- lm(score4 ~ stratio + higheng + I(higheng * stratio) + lunch +
  income + I(income^2) + I(income^3), data = MASchools)
fm6 <- lm(score4 ~ stratio + lunch + income + I(income^2) + I(income^3),
  data = MASchools)

## for comparability with Stata use HC1 below
coeftest(fm1, vcov = vcovHC(fm1, type = "HC1"))
coeftest(fm2, vcov = vcovHC(fm2, type = "HC1"))
coeftest(fm3, vcov = vcovHC(fm3, type = "HC1"))
coeftest(fm4, vcov = vcovHC(fm4, type = "HC1"))
coeftest(fm5, vcov = vcovHC(fm5, type = "HC1"))
coeftest(fm6, vcov = vcovHC(fm6, type = "HC1"))

## Testing exclusion of groups of variables
fm3r <- update(fm3, . ~ . - I(income^2) - I(income^3))
waldtest(fm3, fm3r, vcov = vcovHC(fm3, type = "HC1"))

fm4r_str1 <- update(fm4, . ~ . - stratio - I(stratio^2) - I(stratio^3))
waldtest(fm4, fm4r_str1, vcov = vcovHC(fm4, type = "HC1"))
fm4r_str2 <- update(fm4, . ~ . - I(stratio^2) - I(stratio^3))
waldtest(fm4, fm4r_str2, vcov = vcovHC(fm4, type = "HC1"))
fm4r_inc <- update(fm4, . ~ . - I(income^2) - I(income^3))
waldtest(fm4, fm4r_inc, vcov = vcovHC(fm4, type = "HC1"))

fm5r_str <- update(fm5, . ~ . - stratio - I(higheng * stratio))
waldtest(fm5, fm5r_str, vcov = vcovHC(fm5, type = "HC1"))
fm5r_inc <- update(fm5, . ~ . - I(income^2) - I(income^3))
waldtest(fm5, fm5r_inc, vcov = vcovHC(fm5, type = "HC1"))
fm5r_high <- update(fm5, . ~ . - higheng - I(higheng * stratio))
waldtest(fm5, fm5r_high, vcov = vcovHC(fm5, type = "HC1"))

fm6r_inc <- update(fm6, . ~ . - I(income^2) - I(income^3))
waldtest(fm6, fm6r_inc, vcov = vcovHC(fm6, type = "HC1"))


##################################
## Home mortgage disclosure act ##
##################################

## data
data("HMDA", package = "AER")

## 11.1, 11.3, 11.7, 11.8 and 11.10, pp. 387--395
fm1 <- lm(I(as.numeric(deny) - 1) ~ pirat, data = HMDA)
fm2 <- lm(I(as.numeric(deny) - 1) ~ pirat + afam, data = HMDA)
fm3 <- glm(deny ~ pirat, family = binomial(link = "probit"), data = HMDA)
fm4 <- glm(deny ~ pirat + afam, family = binomial(link = "probit"), data = HMDA)
fm5 <- glm(deny ~ pirat + afam, family = binomial(link = "logit"), data = HMDA)

## Table 11.1, p. 401
mean(HMDA$pirat)
mean(HMDA$hirat)
mean(HMDA$lvrat)
mean(as.numeric(HMDA$chist))
mean(as.numeric(HMDA$mhist))
mean(as.numeric(HMDA$phist)-1)
prop.table(table(HMDA$insurance))
prop.table(table(HMDA$selfemp))
prop.table(table(HMDA$single))
prop.table(table(HMDA$hschool))
mean(HMDA$unemp)
prop.table(table(HMDA$condomin))
prop.table(table(HMDA$afam))
prop.table(table(HMDA$deny))

## Table 11.2, pp. 403--404, numbers refer to columns
HMDA$lvrat <- factor(ifelse(HMDA$lvrat < 0.8, "low",
  ifelse(HMDA$lvrat >= 0.8 & HMDA$lvrat <= 0.95, "medium", "high")),
  levels = c("low", "medium", "high"))
HMDA$mhist <- as.numeric(HMDA$mhist)
HMDA$chist <- as.numeric(HMDA$chist)

fm1 <- lm(I(as.numeric(deny) - 1) ~ afam + pirat + hirat + lvrat + chist + mhist +
  phist + insurance + selfemp, data = HMDA)
fm2 <- glm(deny ~ afam + pirat + hirat + lvrat + chist + mhist + phist + insurance +
  selfemp, family = binomial, data = HMDA)
fm3 <- glm(deny ~ afam + pirat + hirat + lvrat + chist + mhist + phist + insurance +
  selfemp, family = binomial(link = "probit"), data = HMDA)
fm4 <- glm(deny ~ afam + pirat + hirat + lvrat + chist + mhist + phist + insurance +
  selfemp + single + hschool + unemp, family = binomial(link = "probit"), data = HMDA)
fm5 <- glm(deny ~ afam + pirat + hirat + lvrat + chist + mhist + phist + insurance +
  selfemp + single + hschool + unemp + condomin + 
  I(mhist==3) + I(mhist==4) + I(chist==3) + I(chist==4) + I(chist==5) + I(chist==6), 
  family = binomial(link = "probit"), data = HMDA)
fm6 <- glm(deny ~ afam * (pirat + hirat) + lvrat + chist + mhist + phist + insurance +
  selfemp + single + hschool + unemp, family = binomial(link = "probit"), data = HMDA)
coeftest(fm1, vcov = sandwich)

fm4r <- update(fm4, . ~ . - single - hschool - unemp)
waldtest(fm4, fm4r, vcov = sandwich)
fm5r <- update(fm5, . ~ . - single - hschool - unemp)
waldtest(fm5, fm5r, vcov = sandwich)
fm6r <- update(fm6, . ~ . - single - hschool - unemp)
waldtest(fm6, fm6r, vcov = sandwich)

fm5r2 <- update(fm5, . ~ . - I(mhist==3) - I(mhist==4) - I(chist==3) - I(chist==4) -
  I(chist==5) - I(chist==6))
waldtest(fm5, fm5r2, vcov = sandwich)

fm6r2 <- update(fm6, . ~ . - afam * (pirat + hirat) + pirat + hirat)
waldtest(fm6, fm6r2, vcov = sandwich)

fm6r3 <- update(fm6, . ~ . - afam * (pirat + hirat) + pirat + hirat + afam)
waldtest(fm6, fm6r3, vcov = sandwich)



#########################################################
## Shooting down the "More Guns Less Crime" hypothesis ##
#########################################################

## data
data("Guns", package = "AER")

## Empirical Exercise 10.1
fm1 <- lm(log(violent) ~ law, data = Guns)
fm2 <- lm(log(violent) ~ law + prisoners + density + income + 
  population + afam + cauc + male, data = Guns)
fm3 <- lm(log(violent) ~ law + prisoners + density + income + 
  population + afam + cauc + male + state, data = Guns)
fm4 <- lm(log(violent) ~ law + prisoners + density + income + 
  population + afam + cauc + male + state + year, data = Guns)
coeftest(fm1, vcov = sandwich)
coeftest(fm2, vcov = sandwich)
printCoefmat(coeftest(fm3, vcov = sandwich)[1:9,])
printCoefmat(coeftest(fm4, vcov = sandwich)[1:9,])


###########################
## US traffic fatalities ##
###########################

## data from Stock and Watson (2007)
data("Fatalities")
## add fatality rate (number of traffic deaths
## per 10,000 people living in that state in that year)
Fatalities$frate <- with(Fatalities, fatal/pop * 10000)
## add discretized version of minimum legal drinking age
Fatalities$drinkagec <- cut(Fatalities$drinkage,
  breaks = 18:22, include.lowest = TRUE, right = FALSE)
Fatalities$drinkagec <- relevel(Fatalities$drinkagec, ref = 4)
## any punishment?
Fatalities$punish <- with(Fatalities,
  factor(jail == "yes" | service == "yes", labels = c("no", "yes")))
## plm package
library("plm")

## for comparability with Stata we use HC1 below
## p. 351, Eq. (10.2)
f1982 <- subset(Fatalities, year == "1982")
fm_1982 <- lm(frate ~ beertax, data = f1982)
coeftest(fm_1982, vcov = vcovHC(fm_1982, type = "HC1"))

## p. 353, Eq. (10.3)
f1988 <- subset(Fatalities, year == "1988")
fm_1988 <- lm(frate ~ beertax, data = f1988)
coeftest(fm_1988, vcov = vcovHC(fm_1988, type = "HC1"))

## pp. 355, Eq. (10.8)
fm_diff <- lm(I(f1988$frate - f1982$frate) ~ I(f1988$beertax - f1982$beertax))
coeftest(fm_diff, vcov = vcovHC(fm_diff, type = "HC1"))

## pp. 360, Eq. (10.15)
##   (1) via formula
fm_sfe <- lm(frate ~ beertax + state - 1, data = Fatalities)
##   (2) by hand
fat <- with(Fatalities,
  data.frame(frates = frate - ave(frate, state),
  beertaxs = beertax - ave(beertax, state)))
fm_sfe2 <- lm(frates ~ beertaxs - 1, data = fat)
##   (3) via plm()
fm_sfe3 <- plm(frate ~ beertax, data = Fatalities,
  index = c("state", "year"), model = "within")

coeftest(fm_sfe, vcov = vcovHC(fm_sfe, type = "HC1"))[1,]

## uses different df in sd and p-value
coeftest(fm_sfe2, vcov = vcovHC(fm_sfe2, type = "HC1"))[1,]

## uses different df in p-value
coeftest(fm_sfe3, vcov = vcovHC(fm_sfe3, type = "HC1", method = "white1"))[1,]


## pp. 363, Eq. (10.21)
## via lm()
fm_stfe <- lm(frate ~ beertax + state + year - 1, data = Fatalities)
coeftest(fm_stfe, vcov = vcovHC(fm_stfe, type = "HC1"))[1,]
## via plm()
fm_stfe2 <- plm(frate ~ beertax, data = Fatalities,
  index = c("state", "year"), model = "within", effect = "twoways")
coeftest(fm_stfe2, vcov = vcovHC) ## different


## p. 368, Table 10.1, numbers refer to cols.
fm1 <- plm(frate ~ beertax, data = Fatalities, index = c("state", "year"),
  model = "pooling")
fm2 <- plm(frate ~ beertax, data = Fatalities, index = c("state", "year"),
  model = "within")
fm3 <- plm(frate ~ beertax, data = Fatalities, index = c("state", "year"),
  model = "within", effect = "twoways")
fm4 <- plm(frate ~ beertax + drinkagec + jail + service + miles + unemp + log(income),
  data = Fatalities, index = c("state", "year"), model = "within", effect = "twoways")
fm5 <- plm(frate ~ beertax + drinkagec + jail + service + miles,
  data = Fatalities, index = c("state", "year"), model = "within", effect = "twoways")
fm6 <- plm(frate ~ beertax + drinkage + punish + miles + unemp + log(income),
  data = Fatalities, index = c("state", "year"), model = "within", effect = "twoways")
fm7 <- plm(frate ~ beertax + drinkagec + jail + service + miles + unemp + log(income),
  data = Fatalities, index = c("state", "year"), model = "within", effect = "twoways")
## summaries not too close, s.e.s generally too small
coeftest(fm1, vcov = vcovHC)
coeftest(fm2, vcov = vcovHC)
coeftest(fm3, vcov = vcovHC)
coeftest(fm4, vcov = vcovHC)
coeftest(fm5, vcov = vcovHC)
coeftest(fm6, vcov = vcovHC)
coeftest(fm7, vcov = vcovHC)


######################################
## Cigarette consumption panel data ##
######################################

## data and transformations 
data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)
c1985 <- subset(CigarettesSW, year == "1985")
c1995 <- subset(CigarettesSW, year == "1995")

## convenience function: HC1 covariances
hc1 <- function(x) vcovHC(x, type = "HC1")

## Equations 12.9--12.11
fm_s1 <- lm(log(rprice) ~ tdiff, data = c1995)
coeftest(fm_s1, vcov = hc1)
fm_s2 <- lm(log(packs) ~ fitted(fm_s1), data = c1995)
fm_ivreg <- ivreg(log(packs) ~ log(rprice) | tdiff, data = c1995)
coeftest(fm_ivreg, vcov = hc1)

## Equation 12.15
fm_ivreg2 <- ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff,
  data = c1995)
coeftest(fm_ivreg2, vcov = hc1)
## Equation 12.16
fm_ivreg3 <- ivreg(log(packs) ~ log(rprice) + log(rincome) | log(rincome) + tdiff + I(tax/cpi),
  data = c1995)
coeftest(fm_ivreg3, vcov = hc1)

## Table 12.1, p. 448
ydiff <- log(c1995$packs) - log(c1985$packs)
pricediff <- log(c1995$price/c1995$cpi) - log(c1985$price/c1985$cpi)
incdiff <- log(c1995$income/c1995$population/c1995$cpi) -
  log(c1985$income/c1985$population/c1985$cpi)
taxsdiff <- (c1995$taxs - c1995$tax)/c1995$cpi - (c1985$taxs - c1985$tax)/c1985$cpi
taxdiff <- c1995$tax/c1995$cpi - c1985$tax/c1985$cpi

fm_diff1 <- ivreg(ydiff ~ pricediff + incdiff | incdiff + taxsdiff)
fm_diff2 <- ivreg(ydiff ~ pricediff + incdiff | incdiff + taxdiff)
fm_diff3 <- ivreg(ydiff ~ pricediff + incdiff | incdiff + taxsdiff + taxdiff)
coeftest(fm_diff1, vcov = hc1)
coeftest(fm_diff2, vcov = hc1)
coeftest(fm_diff3, vcov = hc1)

## checking instrument relevance
fm_rel1 <- lm(pricediff ~ taxsdiff + incdiff)
fm_rel2 <- lm(pricediff ~ taxdiff + incdiff)
fm_rel3 <- lm(pricediff ~ incdiff + taxsdiff + taxdiff)
linearHypothesis(fm_rel1, "taxsdiff = 0", vcov = hc1)
linearHypothesis(fm_rel2, "taxdiff = 0", vcov = hc1)
linearHypothesis(fm_rel3, c("taxsdiff = 0", "taxdiff = 0"),  vcov = hc1)

## testing overidentifying restrictions (J test)
fm_or <- lm(residuals(fm_diff3) ~ incdiff + taxsdiff + taxdiff)
(fm_or_test <- linearHypothesis(fm_or, c("taxsdiff = 0", "taxdiff = 0"), test = "Chisq"))
## warning: df (and hence p-value) invalid above.
## correct df: # instruments - # endogenous variables
pchisq(fm_or_test[2,5], df.residual(fm_diff3) - df.residual(fm_or), lower.tail = FALSE)


#####################################################
## Project STAR: Student-teacher achievement ratio ##
#####################################################

## data
data("STAR", package = "AER")

## p. 488
fmk <- lm(I(readk + mathk) ~ stark, data = STAR)
fm1 <- lm(I(read1 + math1) ~ star1, data = STAR)
fm2 <- lm(I(read2 + math2) ~ star2, data = STAR)
fm3 <- lm(I(read3 + math3) ~ star3, data = STAR)
coeftest(fm3, vcov = sandwich)

## p. 489
fmke <- lm(I(readk + mathk) ~ stark + experiencek, data = STAR)
coeftest(fmke, vcov = sandwich)

## equivalently:
##   - reshape data from wide into long format
##   - fit a single model nested in grade
## (a) variables and their levels
nam <- c("star", "read", "math", "lunch", "school", "degree", "ladder",
  "experience", "tethnicity", "system", "schoolid")
lev <- c("k", "1", "2", "3")
## (b) reshaping
star <- reshape(STAR, idvar = "id", ids = row.names(STAR),
  times = lev, timevar = "grade", direction = "long",
  varying = lapply(nam, function(x) paste(x, lev, sep = "")))
## (c) improve variable names and type
names(star)[5:15] <- nam
star$id <- factor(star$id)
star$grade <- factor(star$grade, levels = lev,
  labels = c("kindergarten", "1st", "2nd", "3rd"))
rm(nam, lev)
## (d) model fitting
fm <- lm(I(read + math) ~ 0 + grade/star, data = star)


#################################################
## Quarterly US macroeconomic data (1957-2005) ##
#################################################

## data
data("USMacroSW", package = "AER")
library("dynlm")
usm <- ts.intersect(USMacroSW, 4 * 100 * diff(log(USMacroSW[, "cpi"])))
colnames(usm) <- c(colnames(USMacroSW), "infl")

## Equation 14.7, p. 536
fm_ar1 <- dynlm(d(infl) ~ L(d(infl)),
  data = usm, start = c(1962,1), end = c(2004,4))
coeftest(fm_ar1, vcov = sandwich)

## Equation 14.13, p. 538
fm_ar4 <- dynlm(d(infl) ~ L(d(infl), 1:4), 
  data = usm, start = c(1962,1), end = c(2004,4))
coeftest(fm_ar4, vcov = sandwich)

## Equation 14.16, p. 542
fm_adl41 <- dynlm(d(infl) ~ L(d(infl), 1:4) + L(unemp),
  data = usm, start = c(1962,1), end = c(2004,4))
coeftest(fm_adl41, vcov = sandwich)

## Equation 14.17, p. 542
fm_adl44 <- dynlm(d(infl) ~ L(d(infl), 1:4) + L(unemp, 1:4),
  data = usm, start = c(1962,1), end = c(2004,4))
coeftest(fm_adl44, vcov = sandwich)

## Granger causality test mentioned on p. 547
waldtest(fm_ar4, fm_adl44, vcov = sandwich)  

## Equation 14.28, p. 559
fm_sp1 <- dynlm(infl ~ log(gdpjp), start = c(1965,1), end = c(1981,4), data = usm)
coeftest(fm_sp1, vcov = sandwich)

## Equation 14.29, p. 559
fm_sp2 <- dynlm(infl ~ log(gdpjp), start = c(1982,1), end = c(2004,4), data = usm)
coeftest(fm_sp2, vcov = sandwich)

## Equation 14.34, p. 563: ADF by hand
fm_adf <- dynlm(d(infl) ~ L(infl) + L(d(infl), 1:4), 
  data = usm, start = c(1962,1), end = c(2004,4))
coeftest(fm_adf)

## Figure 14.5, p. 570
## SW perform partial break test of unemp coefs
## here full model is used
library("strucchange")
infl <- usm[, "infl"]
unemp <- usm[, "unemp"]
usm <- ts.intersect(diff(infl), lag(diff(infl), k = -1), lag(diff(infl), k = -2),
  lag(diff(infl), k = -3), lag(diff(infl), k = -4), lag(unemp, k = -1),
  lag(unemp, k = -2), lag(unemp, k = -3), lag(unemp, k = -4))
colnames(usm) <- c("dinfl", paste("dinfl", 1:4, sep = ""), paste("unemp", 1:4, sep = ""))
usm <- window(usm, start = c(1962, 1), end = c(2004, 4))
fs <- Fstats(dinfl ~ ., data = usm)
sctest(fs, type = "supF") 
plot(fs)

## alternatively: re-use fm_adl44
mf <- model.frame(fm_adl44)
mf <- ts(as.matrix(mf), start = c(1962, 1), freq = 4)
colnames(mf) <- c("y", paste("x", 1:8, sep = ""))
ff <- as.formula(paste("y", "~",  paste("x", 1:8, sep = "", collapse = " + ")))
fs <- Fstats(ff, data = mf, from = 0.1)
plot(fs)
lines(boundary(fs, alpha = 0.01), lty = 2, col = 2)
lines(boundary(fs, alpha = 0.1), lty = 3, col = 2)


##########################################
## Monthly US stock returns (1931-2002) ##
##########################################

## package and data
library("dynlm")
data("USStocksSW", package = "AER")

## Table 14.3, p. 540
fm1 <- dynlm(returns ~ L(returns), data = USStocksSW, start = c(1960,1))
coeftest(fm1, vcov = sandwich)
fm2 <- dynlm(returns ~ L(returns, 1:2), data = USStocksSW, start = c(1960,1))
waldtest(fm2, vcov = sandwich)
fm3 <- dynlm(returns ~ L(returns, 1:4), data = USStocksSW, start = c(1960,1))
waldtest(fm3, vcov = sandwich)

## Table 14.7, p. 574
fm4 <- dynlm(returns ~ L(returns) + L(d(dividend)),
  data = USStocksSW, start = c(1960, 1))
fm5 <- dynlm(returns ~ L(returns, 1:2) + L(d(dividend), 1:2),
  data = USStocksSW, start = c(1960, 1))
fm6 <- dynlm(returns ~ L(returns) + L(dividend),
  data = USStocksSW, start = c(1960, 1))


##################################
## Price of frozen orange juice ##
##################################

## load data
data("FrozenJuice")

## Stock and Watson, p. 594
library("dynlm")
fm_dyn <- dynlm(d(100 * log(price/ppi)) ~ fdd, data = FrozenJuice)
coeftest(fm_dyn, vcov = vcovHC(fm_dyn, type = "HC1"))

## equivalently, returns can be computed 'by hand'
## (reducing the complexity of the formula notation)
fj <- ts.union(fdd = FrozenJuice[, "fdd"],
  ret = 100 * diff(log(FrozenJuice[,"price"]/FrozenJuice[,"ppi"])))
fm_dyn <- dynlm(ret ~ fdd, data = fj)

## Stock and Watson, p. 595
fm_dl <- dynlm(ret ~ L(fdd, 0:6), data = fj)
coeftest(fm_dl, vcov = vcovHC(fm_dl, type = "HC1"))

## Stock and Watson, Table 15.1, p. 620, numbers refer to columns
## (1) Dynamic Multipliers 
fm1 <- dynlm(ret ~ L(fdd, 0:18), data = fj)
coeftest(fm1, vcov = NeweyWest(fm1, lag = 7, prewhite =  FALSE))
## (2) Cumulative Multipliers
fm2 <- dynlm(ret ~ L(d(fdd), 0:17) + L(fdd, 18), data = fj)
coeftest(fm2, vcov = NeweyWest(fm2, lag = 7, prewhite =  FALSE))
## (3) Cumulative Multipliers, more lags in NW
coeftest(fm2, vcov = NeweyWest(fm2, lag = 14, prewhite =  FALSE))
## (4) Cumulative Multipliers with monthly indicators
fm4 <- dynlm(ret ~ L(d(fdd), 0:17) + L(fdd, 18) + season(fdd), data = fj)
coeftest(fm4, vcov = NeweyWest(fm4, lag = 7, prewhite =  FALSE))
## monthly indicators needed?
fm4r <- update(fm4, . ~ . - season(fdd))
waldtest(fm4, fm4r, vcov= NeweyWest(fm4, lag = 7, prewhite = FALSE)) ## close ...


#############################################
## New York Stock Exchange composite index ##
#############################################

## returns
data("NYSESW", package = "AER")
ret <- 100 * diff(log(NYSESW))
plot(ret)

## fit GARCH(1,1)
library("tseries")
fm <- garch(coredata(ret))



