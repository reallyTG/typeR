library(AER)


### Name: Baltagi2002
### Title: Data and Examples from Baltagi (2002)
### Aliases: Baltagi2002
### Keywords: datasets

### ** Examples

################################
## Cigarette consumption data ##
################################

## data
data("CigarettesB", package = "AER")

## Table 3.3
cig_lm <- lm(packs ~ price, data = CigarettesB)
summary(cig_lm)

## Figure 3.9
plot(residuals(cig_lm) ~ price, data = CigarettesB)
abline(h = 0, lty = 2)

## Figure 3.10
cig_pred <- with(CigarettesB,
  data.frame(price = seq(from = min(price), to = max(price), length = 30)))
cig_pred <- cbind(cig_pred, predict(cig_lm, newdata = cig_pred, interval = "confidence"))
plot(packs ~ price, data = CigarettesB)
lines(fit ~ price, data = cig_pred)
lines(lwr ~ price, data = cig_pred, lty = 2)
lines(upr ~ price, data = cig_pred, lty = 2)

## Chapter 5: diagnostic tests (p. 111-115)
cig_lm2 <- lm(packs ~ price + income, data = CigarettesB)
summary(cig_lm2)
## Glejser tests (p. 112)
ares <- abs(residuals(cig_lm2))
summary(lm(ares ~ income, data = CigarettesB))
summary(lm(ares ~ I(1/income), data = CigarettesB))
summary(lm(ares ~ I(1/sqrt(income)), data = CigarettesB))
summary(lm(ares ~ sqrt(income), data = CigarettesB))
## Goldfeld-Quandt test (p. 112)
gqtest(cig_lm2, order.by = ~ income, data = CigarettesB, fraction = 12, alternative = "less")
## NOTE: Baltagi computes the test statistic as mss1/mss2,
## i.e., tries to find decreasing variances. gqtest() always uses
## mss2/mss1 and has an "alternative" argument.

## Spearman rank correlation test (p. 113)
cor.test(~ ares + income, data = CigarettesB, method = "spearman")
## Breusch-Pagan test (p. 113)
bptest(cig_lm2, varformula = ~ income, data = CigarettesB, student = FALSE)
## White test (Table 5.1, p. 113)
bptest(cig_lm2, ~ income * price + I(income^2) + I(price^2), data = CigarettesB)
## White HC standard errors (Table 5.2, p. 114)
coeftest(cig_lm2, vcov = vcovHC(cig_lm2, type = "HC1"))
## Jarque-Bera test (Figure 5.2, p. 115)
hist(residuals(cig_lm2), breaks = 16, ylim = c(0, 10), col = "lightgray")
library("tseries")
jarque.bera.test(residuals(cig_lm2))

## Tables 8.1 and 8.2
influence.measures(cig_lm2)


#####################################
## US consumption data (1950-1993) ##
#####################################

## data
data("USConsump1993", package = "AER")
plot(USConsump1993, plot.type = "single", col = 1:2)

## Chapter 5 (p. 122-125)
fm <- lm(expenditure ~ income, data = USConsump1993)
summary(fm)
## Durbin-Watson test (p. 122)
dwtest(fm)
## Breusch-Godfrey test (Table 5.4, p. 124)
bgtest(fm)
## Newey-West standard errors (Table 5.5, p. 125)
coeftest(fm, vcov = NeweyWest(fm, lag = 3, prewhite = FALSE, adjust = TRUE)) 

## Chapter 8
library("strucchange")
## Recursive residuals
rr <- recresid(fm)
rr
## Recursive CUSUM test
rcus <- efp(expenditure ~ income, data = USConsump1993)
plot(rcus)
sctest(rcus)
## Harvey-Collier test
harvtest(fm)
## NOTE" Mistake in Baltagi (2002) who computes
## the t-statistic incorrectly as 0.0733 via
mean(rr)/sd(rr)/sqrt(length(rr))
## whereas it should be (as in harvtest)
mean(rr)/sd(rr) * sqrt(length(rr))

## Rainbow test
raintest(fm, center = 23)

## J test for non-nested models
library("dynlm")
fm1 <- dynlm(expenditure ~ income + L(income), data = USConsump1993)
fm2 <- dynlm(expenditure ~ income + L(expenditure), data = USConsump1993)
jtest(fm1, fm2)

## Chapter 11
## Table 11.1 Instrumental-variables regression
usc <- as.data.frame(USConsump1993)
usc$investment <- usc$income - usc$expenditure
fm_ols <- lm(expenditure ~ income, data = usc)
fm_iv <- ivreg(expenditure ~ income | investment, data = usc)
## Hausman test
cf_diff <- coef(fm_iv) - coef(fm_ols)
vc_diff <- vcov(fm_iv) - vcov(fm_ols)
x2_diff <- as.vector(t(cf_diff) %*% solve(vc_diff) %*% cf_diff)
pchisq(x2_diff, df = 2, lower.tail = FALSE)

## Chapter 14
## ACF and PACF for expenditures and first differences
exps <- USConsump1993[, "expenditure"]
(acf(exps))
(pacf(exps))
(acf(diff(exps)))
(pacf(diff(exps)))

## dynamic regressions, eq. (14.8)
fm <- dynlm(d(exps) ~ I(time(exps) - 1949) + L(exps))
summary(fm)


################################
## Grunfeld's investment data ##
################################

## select the first three companies (as panel data)
data("Grunfeld", package = "AER")
pgr <- subset(Grunfeld, firm %in% levels(Grunfeld$firm)[1:3])
library("plm")
pgr <- pdata.frame(pgr, c("firm", "year"))

## Ex. 10.9
library("systemfit")
gr_ols <- systemfit(invest ~ value + capital, method = "OLS", data = pgr)
gr_sur <- systemfit(invest ~ value + capital, method = "SUR", data = pgr)


#########################################
## Panel study on income dynamics 1982 ##
#########################################

## data
data("PSID1982", package = "AER")

## Table 4.1
earn_lm <- lm(log(wage) ~ . + I(experience^2), data = PSID1982)
summary(earn_lm)

## Table 13.1
union_lpm <- lm(I(as.numeric(union) - 1) ~ . - wage, data = PSID1982)
union_probit <- glm(union ~ . - wage, data = PSID1982, family = binomial(link = "probit"))
union_logit <- glm(union ~ . - wage, data = PSID1982, family = binomial)
## probit OK, logit and LPM rather different.



