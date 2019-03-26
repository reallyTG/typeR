library(AER)


### Name: Greene2003
### Title: Data and Examples from Greene (2003)
### Aliases: Greene2003
### Keywords: datasets

### ** Examples

#####################################
## US consumption data (1970-1979) ##
#####################################

## Example 1.1
data("USConsump1979", package = "AER")
plot(expenditure ~ income, data = as.data.frame(USConsump1979), pch = 19)
fm <- lm(expenditure ~ income, data = as.data.frame(USConsump1979))
summary(fm)
abline(fm)


#####################################
## US consumption data (1940-1950) ##
#####################################

## data
data("USConsump1950", package = "AER")
usc <- as.data.frame(USConsump1950)
usc$war <- factor(usc$war, labels = c("no", "yes"))

## Example 2.1
plot(expenditure ~ income, data = usc, type = "n", xlim = c(225, 375), ylim = c(225, 350))
with(usc, text(income, expenditure, time(USConsump1950)))

## single model
fm <- lm(expenditure ~ income, data = usc)
summary(fm)

## different intercepts for war yes/no
fm2 <- lm(expenditure ~ income + war, data = usc)
summary(fm2)

## compare
anova(fm, fm2)

## visualize
abline(fm, lty = 3)                                   
abline(coef(fm2)[1:2])                                
abline(sum(coef(fm2)[c(1, 3)]), coef(fm2)[2], lty = 2)

## Example 3.2
summary(fm)$r.squared
summary(lm(expenditure ~ income, data = usc, subset = war == "no"))$r.squared
summary(fm2)$r.squared


########################
## US investment data ##
########################

data("USInvest", package = "AER")

## Chapter 3 in Greene (2003)
## transform (and round) data to match Table 3.1
us <- as.data.frame(USInvest)
us$invest <- round(0.1 * us$invest/us$price, digits = 3)
us$gnp <- round(0.1 * us$gnp/us$price, digits = 3)
us$inflation <- c(4.4, round(100 * diff(us$price)/us$price[-15], digits = 2))
us$trend <- 1:15
us <- us[, c(2, 6, 1, 4, 5)]

## p. 22-24
coef(lm(invest ~ trend + gnp, data = us))
coef(lm(invest ~ gnp, data = us))

## Example 3.1, Table 3.2
cor(us)[1,-1]
pcor <- solve(cor(us))
dcor <- 1/sqrt(diag(pcor))
pcor <- (-pcor * (dcor %o% dcor))[1,-1]

## Table 3.4
fm  <- lm(invest ~ trend + gnp + interest + inflation, data = us)
fm1 <- lm(invest ~ 1, data = us)
anova(fm1, fm)

## Example 4.1
set.seed(123)
w <- rnorm(10000)
x <- rnorm(10000)
eps <- 0.5 * w
y <- 0.5 + 0.5 * x + eps
b <- rep(0, 500)
for(i in 1:500) {
  ix <- sample(1:10000, 100)
  b[i] <- lm.fit(cbind(1, x[ix]), y[ix])$coef[2]
}
hist(b, breaks = 20, col = "lightgray")


###############################
## Longley's regression data ##
###############################

## package and data
data("Longley", package = "AER")
library("dynlm")

## Example 4.6
fm1 <- dynlm(employment ~ time(employment) + price + gnp + armedforces,
  data = Longley)
fm2 <- update(fm1, end = 1961)
cbind(coef(fm2), coef(fm1))

## Figure 4.3
plot(rstandard(fm2), type = "b", ylim = c(-3, 3))
abline(h = c(-2, 2), lty = 2)


#########################################
## US gasoline market data (1960-1995) ##
#########################################

## data
data("USGasG", package = "AER")

## Greene (2003)
## Example 2.3
fm <- lm(log(gas/population) ~ log(price) + log(income) + log(newcar) + log(usedcar),
  data = as.data.frame(USGasG))
summary(fm)

## Example 4.4
## estimates and standard errors (note different offset for intercept)
coef(fm)
sqrt(diag(vcov(fm)))
## confidence interval
confint(fm, parm = "log(income)")
## test linear hypothesis
linearHypothesis(fm, "log(income) = 1")

## Figure 7.5
plot(price ~ gas, data = as.data.frame(USGasG), pch = 19,
  col = (time(USGasG) > 1973) + 1)
legend("topleft", legend = c("after 1973", "up to 1973"), pch = 19, col = 2:1, bty = "n")

## Example 7.6
## re-used in Example 8.3
## linear time trend
ltrend <- 1:nrow(USGasG)
## shock factor
shock <- factor(time(USGasG) > 1973, levels = c(FALSE, TRUE), labels = c("before", "after"))

## 1960-1995
fm1 <- lm(log(gas/population) ~ log(income) + log(price) + log(newcar) + log(usedcar) + ltrend,
  data = as.data.frame(USGasG))
summary(fm1)
## pooled
fm2 <- lm(
  log(gas/population) ~ shock + log(income) + log(price) + log(newcar) + log(usedcar) + ltrend,
  data = as.data.frame(USGasG))
summary(fm2)
## segmented
fm3 <- lm(
  log(gas/population) ~ shock/(log(income) + log(price) + log(newcar) + log(usedcar) + ltrend),
  data = as.data.frame(USGasG))
summary(fm3)

## Chow test
anova(fm3, fm1)
library("strucchange")
sctest(log(gas/population) ~ log(income) + log(price) + log(newcar) + log(usedcar) + ltrend,
  data = USGasG, point = c(1973, 1), type = "Chow")
## Recursive CUSUM test
rcus <- efp(log(gas/population) ~ log(income) + log(price) + log(newcar) + log(usedcar) + ltrend,
   data = USGasG, type = "Rec-CUSUM")
plot(rcus)
sctest(rcus)
## Note: Greene's remark that the break is in 1984 (where the process crosses its boundary)
## is wrong. The break appears to be no later than 1976.

## Example 12.2
library("dynlm")
resplot <- function(obj, bound = TRUE) {
  res <- residuals(obj)
  sigma <- summary(obj)$sigma
  plot(res, ylab = "Residuals", xlab = "Year")
  grid()
  abline(h = 0)
  if(bound) abline(h = c(-2, 2) * sigma, col = "red")  
  lines(res)
}
resplot(dynlm(log(gas/population) ~ log(price), data = USGasG))
resplot(dynlm(log(gas/population) ~ log(price) + log(income), data = USGasG))
resplot(dynlm(log(gas/population) ~ log(price) + log(income) + log(newcar) + log(usedcar) +
  log(transport) + log(nondurable) + log(durable) +log(service) + ltrend, data = USGasG))
## different shock variable than in 7.6
shock <- factor(time(USGasG) > 1974, levels = c(FALSE, TRUE), labels = c("before", "after"))
resplot(dynlm(log(gas/population) ~ shock/(log(price) + log(income) + log(newcar) + log(usedcar) +
  log(transport) + log(nondurable) + log(durable) + log(service) + ltrend), data = USGasG))
## NOTE: something seems to be wrong with the sigma estimates in the `full' models

## Table 12.4, OLS
fm <- dynlm(log(gas/population) ~ log(price) + log(income) + log(newcar) + log(usedcar),
  data = USGasG)
summary(fm)
resplot(fm, bound = FALSE)
dwtest(fm)

## ML
g <- as.data.frame(USGasG)
y <- log(g$gas/g$population)
X <- as.matrix(cbind(log(g$price), log(g$income), log(g$newcar), log(g$usedcar)))
arima(y, order = c(1, 0, 0), xreg = X)


#######################################
## US macroeconomic data (1950-2000) ##
#######################################
## data and trend
data("USMacroG", package = "AER")
ltrend <- 0:(nrow(USMacroG) - 1)

## Example 5.3
## OLS and IV regression
library("dynlm")
fm_ols <- dynlm(consumption ~ gdp, data = USMacroG)
fm_iv <- dynlm(consumption ~ gdp | L(consumption) + L(gdp), data = USMacroG)

## Hausman statistic
library("MASS")
b_diff <- coef(fm_iv) - coef(fm_ols)
v_diff <- summary(fm_iv)$cov.unscaled - summary(fm_ols)$cov.unscaled
(t(b_diff) %*% ginv(v_diff) %*% b_diff) / summary(fm_ols)$sigma^2

## Wu statistic
auxreg <- dynlm(gdp ~ L(consumption) + L(gdp), data = USMacroG)
coeftest(dynlm(consumption ~ gdp + fitted(auxreg), data = USMacroG))[3,3] 
## agrees with Greene (but not with errata)

## Example 6.1
## Table 6.1
fm6.1 <- dynlm(log(invest) ~ tbill + inflation + log(gdp) + ltrend, data = USMacroG)
fm6.3 <- dynlm(log(invest) ~ I(tbill - inflation) + log(gdp) + ltrend, data = USMacroG)
summary(fm6.1)
summary(fm6.3)
deviance(fm6.1)
deviance(fm6.3)
vcov(fm6.1)[2,3] 

## F test
linearHypothesis(fm6.1, "tbill + inflation = 0")
## alternatively
anova(fm6.1, fm6.3)
## t statistic
sqrt(anova(fm6.1, fm6.3)[2,5])
 
## Example 6.3
## Distributed lag model:
## log(Ct) = b0 + b1 * log(Yt) + b2 * log(C(t-1)) + u
us <- log(USMacroG[, c(2, 5)])
fm_distlag <- dynlm(log(consumption) ~ log(dpi) + L(log(consumption)),
  data = USMacroG)
summary(fm_distlag)

## estimate and test long-run MPC 
coef(fm_distlag)[2]/(1-coef(fm_distlag)[3])
linearHypothesis(fm_distlag, "log(dpi) + L(log(consumption)) = 1")
## correct, see errata
 
## Example 6.4
## predict investiment in 2001(1)
predict(fm6.1, interval = "prediction",
  newdata = data.frame(tbill = 4.48, inflation = 5.262, gdp = 9316.8, ltrend = 204))

## Example 7.7
## no GMM available in "strucchange"
## using OLS instead yields
fs <- Fstats(log(m1/cpi) ~ log(gdp) + tbill, data = USMacroG,
  vcov = NeweyWest, from = c(1957, 3), to = c(1991, 3))
plot(fs)
## which looks somewhat similar ...
 
## Example 8.2
## Ct = b0 + b1*Yt + b2*Y(t-1) + v
fm1 <- dynlm(consumption ~ dpi + L(dpi), data = USMacroG)
## Ct = a0 + a1*Yt + a2*C(t-1) + u
fm2 <- dynlm(consumption ~ dpi + L(consumption), data = USMacroG)

## Cox test in both directions:
coxtest(fm1, fm2)
## ... and do the same for jtest() and encomptest().
## Notice that in this particular case two of them are coincident.
jtest(fm1, fm2)
encomptest(fm1, fm2)
## encomptest could also be performed `by hand' via
fmE <- dynlm(consumption ~ dpi + L(dpi) + L(consumption), data = USMacroG)
waldtest(fm1, fmE, fm2)

## Table 9.1
fm_ols <- lm(consumption ~ dpi, data = as.data.frame(USMacroG))
fm_nls <- nls(consumption ~ alpha + beta * dpi^gamma,
  start = list(alpha = coef(fm_ols)[1], beta = coef(fm_ols)[2], gamma = 1),
  control = nls.control(maxiter = 100), data = as.data.frame(USMacroG))
summary(fm_ols)
summary(fm_nls)
deviance(fm_ols)
deviance(fm_nls)
vcov(fm_nls)

## Example 9.7
## F test
fm_nls2 <- nls(consumption ~ alpha + beta * dpi,
  start = list(alpha = coef(fm_ols)[1], beta = coef(fm_ols)[2]),
  control = nls.control(maxiter = 100), data = as.data.frame(USMacroG))
anova(fm_nls, fm_nls2)
## Wald test
linearHypothesis(fm_nls, "gamma = 1")

## Example 9.8, Table 9.2
usm <- USMacroG[, c("m1", "tbill", "gdp")]
fm_lin <- lm(m1 ~ tbill + gdp, data = usm)
fm_log <- lm(m1 ~ tbill + gdp, data = log(usm))
## PE auxiliary regressions
aux_lin <- lm(m1 ~ tbill + gdp + I(fitted(fm_log) - log(fitted(fm_lin))), data = usm)
aux_log <- lm(m1 ~ tbill + gdp + I(fitted(fm_lin) - exp(fitted(fm_log))), data = log(usm))
coeftest(aux_lin)[4,]
coeftest(aux_log)[4,]
## matches results from errata
## With lmtest >= 0.9-24:
## petest(fm_lin, fm_log)

## Example 12.1
fm_m1 <- dynlm(log(m1) ~ log(gdp) + log(cpi), data = USMacroG)
summary(fm_m1)

## Figure 12.1
par(las = 1)
plot(0, 0, type = "n", axes = FALSE,
     xlim = c(1950, 2002), ylim = c(-0.3, 0.225),
     xaxs = "i", yaxs = "i",
     xlab = "Quarter", ylab = "", main = "Least Squares Residuals")
box()
axis(1, at = c(1950, 1963, 1976, 1989, 2002))
axis(2, seq(-0.3, 0.225, by = 0.075))
grid(4, 7, col = grey(0.6))
abline(0, 0)
lines(residuals(fm_m1), lwd = 2)

## Example 12.3
fm_pc <- dynlm(d(inflation) ~ unemp, data = USMacroG)
summary(fm_pc)
## Figure 12.3
plot(residuals(fm_pc))
## natural unemployment rate
coef(fm_pc)[1]/coef(fm_pc)[2]
## autocorrelation
res <- residuals(fm_pc)
summary(dynlm(res ~ L(res)))

## Example 12.4
coeftest(fm_m1)
coeftest(fm_m1, vcov = NeweyWest(fm_m1, lag = 5))
summary(fm_m1)$r.squared
dwtest(fm_m1)
as.vector(acf(residuals(fm_m1), plot = FALSE)$acf)[2]
## matches Tab. 12.1 errata and Greene 6e, apart from Newey-West SE


#################################################
## Cost function of electricity producers 1870 ##
#################################################

## Example 5.6: a generalized Cobb-Douglas cost function
data("Electricity1970", package = "AER")
fm <- lm(log(cost/fuel) ~ log(output) + I(log(output)^2/2) + 
  log(capital/fuel) + log(labor/fuel), data=Electricity1970[1:123,])


####################################################
## SIC 33: Production for primary metals industry ##
####################################################

## data
data("SIC33", package = "AER")

## Example 6.2
## Translog model
fm_tl <- lm(
  output ~ labor + capital + I(0.5 * labor^2) + I(0.5 * capital^2) + I(labor * capital),
  data = log(SIC33))
## Cobb-Douglas model
fm_cb <- lm(output ~ labor + capital, data = log(SIC33))

## Table 6.2 in Greene (2003)
deviance(fm_tl)
deviance(fm_cb)
summary(fm_tl)
summary(fm_cb)
vcov(fm_tl)
vcov(fm_cb)

## Cobb-Douglas vs. Translog model
anova(fm_cb, fm_tl)
## hypothesis of constant returns
linearHypothesis(fm_cb, "labor + capital = 1")


###############################
## Cost data for US airlines ##
###############################

## data
data("USAirlines", package = "AER")

## Example 7.2
fm_full <- lm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load + year + firm,
  data = USAirlines)
fm_time <- lm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load + year,
  data = USAirlines)
fm_firm <- lm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load + firm,
  data = USAirlines)
fm_no <- lm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load, data = USAirlines)

## full fitted model
coef(fm_full)[1:5]
plot(1970:1984, c(coef(fm_full)[6:19], 0), type = "n",
     xlab = "Year", ylab = expression(delta(Year)),
     main = "Estimated Year Specific Effects")
grid()
points(1970:1984, c(coef(fm_full)[6:19], 0), pch = 19)

## Table 7.2
anova(fm_full, fm_time)
anova(fm_full, fm_firm)
anova(fm_full, fm_no)

## alternatively, use plm()
library("plm")
usair <- pdata.frame(USAirlines, c("firm", "year"))
fm_full2 <- plm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load,
  data = usair, model = "within", effect = "twoways")
fm_time2 <- plm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load,
  data = usair, model = "within", effect = "time")
fm_firm2 <- plm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load,
  data = usair, model = "within", effect = "individual")
fm_no2 <- plm(log(cost) ~ log(output) + I(log(output)^2) + log(price) + load,
  data = usair, model = "pooling")
pFtest(fm_full2, fm_time2)
pFtest(fm_full2, fm_firm2)
pFtest(fm_full2, fm_no2)


## Example 13.1, Table 13.1
fm_no <- plm(log(cost) ~ log(output) + log(price) + load, data = usair, model = "pooling")
fm_gm <- plm(log(cost) ~ log(output) + log(price) + load, data = usair, model = "between")
fm_firm <- plm(log(cost) ~ log(output) + log(price) + load, data = usair, model = "within")
fm_time <- plm(log(cost) ~ log(output) + log(price) + load, data = usair, model = "within",
  effect = "time")
fm_ft <- plm(log(cost) ~ log(output) + log(price) + load, data = usair, model = "within",
  effect = "twoways")

summary(fm_no)
summary(fm_gm)
summary(fm_firm)
fixef(fm_firm)
summary(fm_time)
fixef(fm_time)
summary(fm_ft)
fixef(fm_ft, effect = "individual")
fixef(fm_ft, effect = "time")

## Table 13.2
fm_rfirm <- plm(log(cost) ~ log(output) + log(price) + load, data = usair, model = "random")
fm_rft <- plm(log(cost) ~ log(output) + log(price) + load, data = usair, model = "random",
  effect = "twoways")
summary(fm_rfirm)
summary(fm_rft)


#################################################
## Cost function of electricity producers 1955 ##
#################################################

## Nerlove data
data("Electricity1955", package = "AER")
Electricity <- Electricity1955[1:145,]

## Example 7.3
## Cobb-Douglas cost function
fm_all <- lm(log(cost/fuel) ~ log(output) + log(labor/fuel) + log(capital/fuel),
  data = Electricity)
summary(fm_all)

## hypothesis of constant returns to scale
linearHypothesis(fm_all, "log(output) = 1")

## Figure 7.4
plot(residuals(fm_all) ~ log(output), data = Electricity)
## scaling seems to be different in Greene (2003) with logQ > 10?

## grouped functions
Electricity$group <- with(Electricity, cut(log(output), quantile(log(output), 0:5/5),
  include.lowest = TRUE, labels = 1:5))
fm_group <- lm(
  log(cost/fuel) ~ group/(log(output) + log(labor/fuel) + log(capital/fuel)) - 1,
  data = Electricity)

## Table 7.3 (close, but not quite)
round(rbind(coef(fm_all)[-1], matrix(coef(fm_group), nrow = 5)[,-1]), digits = 3)

## Table 7.4
## log quadratic cost function
fm_all2 <- lm(
  log(cost/fuel) ~ log(output) + I(log(output)^2) + log(labor/fuel) + log(capital/fuel),
  data = Electricity)
summary(fm_all2)


##########################
## Technological change ##
##########################

## Exercise 7.1
data("TechChange", package = "AER")
fm1 <- lm(I(output/technology) ~ log(clr), data = TechChange)
fm2 <- lm(I(output/technology) ~ I(1/clr), data = TechChange)
fm3 <- lm(log(output/technology) ~ log(clr), data = TechChange)
fm4 <- lm(log(output/technology) ~ I(1/clr), data = TechChange)

## Exercise 7.2 (a) and (c)
plot(I(output/technology) ~ clr, data = TechChange)
sctest(I(output/technology) ~ log(clr), data = TechChange,
  type = "Chow", point = c(1942, 1))


##################################
## Expenditure and default data ##
##################################

## full data set (F21.4)
data("CreditCard", package = "AER")

## extract data set F9.1
ccard <- CreditCard[1:100,]
ccard$income <- round(ccard$income, digits = 2)
ccard$expenditure <- round(ccard$expenditure, digits = 2)
ccard$age <- round(ccard$age + .01)
## suspicious:
CreditCard$age[CreditCard$age < 1]
## the first of these is also in TableF9.1 with 36 instead of 0.5:
ccard$age[79] <- 36

## Example 11.1
ccard <- ccard[order(ccard$income),]
ccard0 <- subset(ccard, expenditure > 0)
cc_ols <- lm(expenditure ~ age + owner + income + I(income^2), data = ccard0)

## Figure 11.1
plot(residuals(cc_ols) ~ income, data = ccard0, pch = 19)

## Table 11.1
mean(ccard$age)
prop.table(table(ccard$owner))
mean(ccard$income)

summary(cc_ols)
sqrt(diag(vcovHC(cc_ols, type = "HC0")))
sqrt(diag(vcovHC(cc_ols, type = "HC2"))) 
sqrt(diag(vcovHC(cc_ols, type = "HC1")))

bptest(cc_ols, ~ (age + income + I(income^2) + owner)^2 + I(age^2) + I(income^4),
  data = ccard0)
gqtest(cc_ols)
bptest(cc_ols, ~ income + I(income^2), data = ccard0, studentize = FALSE)
bptest(cc_ols, ~ income + I(income^2), data = ccard0)

## Table 11.2, WLS and FGLS
cc_wls1 <- lm(expenditure ~ age + owner + income + I(income^2), weights = 1/income,
  data = ccard0)
cc_wls2 <- lm(expenditure ~ age + owner + income + I(income^2), weights = 1/income^2,
  data = ccard0)

auxreg1 <- lm(log(residuals(cc_ols)^2) ~ log(income), data = ccard0)
cc_fgls1 <- lm(expenditure ~ age + owner + income + I(income^2),
  weights = 1/exp(fitted(auxreg1)), data = ccard0)

auxreg2 <- lm(log(residuals(cc_ols)^2) ~ income + I(income^2), data = ccard0)
cc_fgls2 <- lm(expenditure ~ age + owner + income + I(income^2),
  weights = 1/exp(fitted(auxreg2)), data = ccard0)

alphai <- coef(lm(log(residuals(cc_ols)^2) ~ log(income), data = ccard0))[2]
alpha <- 0
while(abs((alphai - alpha)/alpha) > 1e-7) {
  alpha <- alphai
  cc_fgls3 <- lm(expenditure ~ age + owner + income + I(income^2), weights = 1/income^alpha,
    data = ccard0)
  alphai <- coef(lm(log(residuals(cc_fgls3)^2) ~ log(income), data = ccard0))[2]
}
alpha ## 1.7623 for Greene
cc_fgls3 <- lm(expenditure ~ age + owner + income + I(income^2), weights = 1/income^alpha,
  data = ccard0)

llik <- function(alpha)
  -logLik(lm(expenditure ~ age + owner + income + I(income^2), weights = 1/income^alpha,
    data = ccard0))
plot(0:100/20, -sapply(0:100/20, llik), type = "l", xlab = "alpha", ylab = "logLik")
alpha <- optimize(llik, interval = c(0, 5))$minimum
cc_fgls4 <- lm(expenditure ~ age + owner + income + I(income^2), weights = 1/income^alpha,
  data = ccard0)

## Table 11.2
cc_fit <- list(cc_ols, cc_wls1, cc_wls2, cc_fgls2, cc_fgls1, cc_fgls3, cc_fgls4)
t(sapply(cc_fit, coef))
t(sapply(cc_fit, function(obj) sqrt(diag(vcov(obj)))))

## Table 21.21, Poisson and logit models
cc_pois <- glm(reports ~ age + income + expenditure, data = CreditCard, family = poisson)
summary(cc_pois)
logLik(cc_pois)
xhat <- colMeans(CreditCard[, c("age", "income", "expenditure")])
xhat <- as.data.frame(t(xhat))
lambda <- predict(cc_pois, newdata = xhat, type = "response")
ppois(0, lambda) * nrow(CreditCard)

cc_logit <- glm(factor(reports > 0) ~ age + income + owner,
  data = CreditCard, family = binomial)
summary(cc_logit)
logLik(cc_logit)

## Table 21.21, "split population model"
library("pscl")
cc_zip <- zeroinfl(reports ~ age + income + expenditure | age + income + owner,
  data = CreditCard)
summary(cc_zip)
sum(predict(cc_zip, type = "prob")[,1])


###################################
## DEM/GBP exchange rate returns ##
###################################

## data as given by Greene (2003)
data("MarkPound")
mp <- round(MarkPound, digits = 6)

## Figure 11.3 in Greene (2003)
plot(mp)

## Example 11.8 in Greene (2003), Table 11.5
library("tseries")
mp_garch <- garch(mp, grad = "numerical")
summary(mp_garch)
logLik(mp_garch)  
## Greene (2003) also includes a constant and uses different
## standard errors (presumably computed from Hessian), here
## OPG standard errors are used. garchFit() in "fGarch"
## implements the approach used by Greene (2003).

## compare Errata to Greene (2003)
library("dynlm")
res <- residuals(dynlm(mp ~ 1))^2
mp_ols <- dynlm(res ~ L(res, 1:10))
summary(mp_ols)
logLik(mp_ols)
summary(mp_ols)$r.squared * length(residuals(mp_ols))


################################
## Grunfeld's investment data ##
################################

## subset of data with mistakes
data("Grunfeld", package = "AER")
ggr <- subset(Grunfeld, firm %in% c("General Motors", "US Steel",
  "General Electric", "Chrysler", "Westinghouse"))
ggr[c(26, 38), 1] <- c(261.6, 645.2)
ggr[32, 3] <- 232.6

## Tab. 13.4
fm_pool <- lm(invest ~ value + capital, data = ggr)
summary(fm_pool)
logLik(fm_pool)
## White correction
sqrt(diag(vcovHC(fm_pool, type = "HC0")))

## heteroskedastic FGLS
auxreg1 <- lm(residuals(fm_pool)^2 ~ firm - 1, data = ggr)
fm_pfgls <- lm(invest ~ value + capital, data = ggr, weights = 1/fitted(auxreg1))
summary(fm_pfgls)

## ML, computed as iterated FGLS
sigmasi <- fitted(lm(residuals(fm_pfgls)^2 ~ firm - 1 , data = ggr))
sigmas <- 0
while(any(abs((sigmasi - sigmas)/sigmas) > 1e-7)) {
   sigmas <- sigmasi
   fm_pfgls_i <- lm(invest ~ value + capital, data = ggr, weights = 1/sigmas)
   sigmasi <- fitted(lm(residuals(fm_pfgls_i)^2 ~ firm - 1 , data = ggr))
   }
fm_pmlh <- lm(invest ~ value + capital, data = ggr, weights = 1/sigmas)
summary(fm_pmlh)
logLik(fm_pmlh)

## Tab. 13.5
auxreg2 <- lm(residuals(fm_pfgls)^2 ~ firm - 1, data = ggr)
auxreg3 <- lm(residuals(fm_pmlh)^2 ~ firm - 1, data = ggr)
rbind(
  "OLS" = coef(auxreg1),
  "Het. FGLS" = coef(auxreg2),
  "Het. ML" = coef(auxreg3))


## Chapter 14: explicitly treat as panel data
library("plm")
pggr <- pdata.frame(ggr, c("firm", "year"))

## Tab. 14.1
library("systemfit")
fm_sur <- systemfit(invest ~ value + capital, data = pggr, method = "SUR",
  methodResidCov = "noDfCor")
fm_psur <- systemfit(invest ~ value + capital, data = pggr, method = "SUR", pooled = TRUE, 
  methodResidCov = "noDfCor", residCovWeighted = TRUE)

## Tab 14.2
fm_ols <- systemfit(invest ~ value + capital, data = pggr, method = "OLS")
fm_pols <- systemfit(invest ~ value + capital, data = pggr, method = "OLS", pooled = TRUE)
## or "by hand"
fm_gm <- lm(invest ~ value + capital, data = ggr, subset = firm == "General Motors")
mean(residuals(fm_gm)^2)   ## Greene uses MLE
## etc.
fm_pool <- lm(invest ~ value + capital, data = ggr)

## Tab. 14.3 (and Tab 13.4, cross-section ML)
## (not run due to long computation time)
## Not run: 
##D fm_ml <- systemfit(invest ~ value + capital, data = pggr, method = "SUR",
##D   methodResidCov = "noDfCor", maxiter = 1000, tol = 1e-10)
##D fm_pml <- systemfit(invest ~ value + capital, data = pggr, method = "SUR", pooled = TRUE, 
##D   methodResidCov = "noDfCor", residCovWeighted = TRUE, maxiter = 1000, tol = 1e-10)
## End(Not run)

## Fig. 14.2
plot(unlist(residuals(fm_sur)[, c(3, 1, 2, 5, 4)]), 
  type = "l", ylab = "SUR residuals", ylim = c(-400, 400), xaxs = "i", yaxs = "i")
abline(v = c(20,40,60,80), h = 0, lty = 2)


###################
## Klein model I ##
###################

## data
data("KleinI", package = "AER")

## Tab. 15.3, OLS
library("dynlm")
fm_cons <- dynlm(consumption ~ cprofits + L(cprofits) + I(pwage + gwage), data = KleinI)
fm_inv <- dynlm(invest ~ cprofits + L(cprofits) + capital, data = KleinI)
fm_pwage <- dynlm(pwage ~ gnp + L(gnp) + I(time(gnp) - 1931), data = KleinI)
summary(fm_cons)
summary(fm_inv)
summary(fm_pwage)
## Notes:
##  - capital refers to previous year's capital stock -> no lag needed!
##  - trend used by Greene (p. 381, "time trend measured as years from 1931")
##    Maddala uses years since 1919

## preparation of data frame for systemfit
KI <- ts.intersect(KleinI, lag(KleinI, k = -1), dframe = TRUE)
names(KI) <- c(colnames(KleinI), paste("L", colnames(KleinI), sep = ""))
KI$trend <- (1921:1941) - 1931

library("systemfit")
system <- list(
  consumption = consumption ~ cprofits + Lcprofits + I(pwage + gwage),
  invest = invest ~ cprofits + Lcprofits + capital,
  pwage = pwage ~ gnp + Lgnp + trend)

## Tab. 15.3 OLS again
fm_ols <- systemfit(system, method = "OLS", data = KI)
summary(fm_ols)

## Tab. 15.3 2SLS, 3SLS, I3SLS
inst <- ~ Lcprofits + capital + Lgnp + gexpenditure + taxes + trend + gwage
fm_2sls <- systemfit(system, method = "2SLS", inst = inst,
  methodResidCov = "noDfCor", data = KI)

fm_3sls <- systemfit(system, method = "3SLS", inst = inst,
  methodResidCov = "noDfCor", data = KI)

fm_i3sls <- systemfit(system, method = "3SLS", inst = inst,
  methodResidCov = "noDfCor", maxiter = 100, data = KI)


############################################
## Transportation equipment manufacturing ##
############################################

## data
data("Equipment", package = "AER")

## Example 17.5
## Cobb-Douglas
fm_cd <- lm(log(valueadded/firms) ~ log(capital/firms) + log(labor/firms),
  data = Equipment)

## generalized Cobb-Douglas with Zellner-Revankar trafo
GCobbDouglas <- function(theta)
 lm(I(log(valueadded/firms) + theta * valueadded/firms) ~ log(capital/firms) + log(labor/firms),
     data = Equipment)

## yields classical Cobb-Douglas for theta = 0
fm_cd0 <- GCobbDouglas(0)

## ML estimation of generalized model
## choose starting values from classical model
par0 <- as.vector(c(coef(fm_cd0), 0, mean(residuals(fm_cd0)^2)))

## set up likelihood function
nlogL <- function(par) {
  beta <- par[1:3]
  theta <- par[4]
  sigma2 <- par[5]

  Y <- with(Equipment, valueadded/firms)
  K <- with(Equipment, capital/firms)
  L <- with(Equipment, labor/firms)

  rhs <- beta[1] + beta[2] * log(K) + beta[3] * log(L)
  lhs <- log(Y) + theta * Y

  rval <- sum(log(1 + theta * Y) - log(Y) +
    dnorm(lhs, mean = rhs, sd = sqrt(sigma2), log = TRUE))
  return(-rval)
}

## optimization
opt <- optim(par0, nlogL, hessian = TRUE)

## Table 17.2
opt$par
sqrt(diag(solve(opt$hessian)))[1:4]
-opt$value

## re-fit ML model
fm_ml <- GCobbDouglas(opt$par[4])
deviance(fm_ml)
sqrt(diag(vcov(fm_ml)))

## fit NLS model
rss <- function(theta) deviance(GCobbDouglas(theta))
optim(0, rss)
opt2 <- optimize(rss, c(-1, 1))
fm_nls <- GCobbDouglas(opt2$minimum)
-nlogL(c(coef(fm_nls), opt2$minimum, mean(residuals(fm_nls)^2)))


############################
## Municipal expenditures ##
############################

## Table 18.2
data("Municipalities", package = "AER")
summary(Municipalities)


###########################
## Program effectiveness ##
###########################

## Table 21.1, col. "Probit"
data("ProgramEffectiveness", package = "AER")
fm_probit <- glm(grade ~ average + testscore + participation,
  data = ProgramEffectiveness, family = binomial(link = "probit"))
summary(fm_probit)


####################################
## Labor force participation data ##
####################################

## data and transformations
data("PSID1976", package = "AER")
PSID1976$kids <- with(PSID1976, factor((youngkids + oldkids) > 0,
  levels = c(FALSE, TRUE), labels = c("no", "yes")))
PSID1976$nwincome <- with(PSID1976, (fincome - hours * wage)/1000)

## Example 4.1, Table 4.2
## (reproduced in Example 7.1, Table 7.1)
gr_lm <- lm(log(hours * wage) ~ age + I(age^2) + education + kids,
  data = PSID1976, subset = participation == "yes")
summary(gr_lm)
vcov(gr_lm)

## Example 4.5
summary(gr_lm)
## or equivalently
gr_lm1 <- lm(log(hours * wage) ~ 1, data = PSID1976, subset = participation == "yes")
anova(gr_lm1, gr_lm)

## Example 21.4, p. 681, and Tab. 21.3, p. 682
gr_probit1 <- glm(participation ~ age + I(age^2) + I(fincome/10000) + education + kids,
  data = PSID1976, family = binomial(link = "probit") )
gr_probit2 <- glm(participation ~ age + I(age^2) + I(fincome/10000) + education,
  data = PSID1976, family = binomial(link = "probit"))
gr_probit3 <- glm(participation ~ kids/(age + I(age^2) + I(fincome/10000) + education),
  data = PSID1976, family = binomial(link = "probit"))
## LR test of all coefficients
lrtest(gr_probit1)
## Chow-type test
lrtest(gr_probit2, gr_probit3)
## equivalently:
anova(gr_probit2, gr_probit3, test = "Chisq")
## Table 21.3
summary(gr_probit1)

## Example 22.8, Table 22.7, p. 786
library("sampleSelection")
gr_2step <- selection(participation ~ age + I(age^2) + fincome + education + kids, 
  wage ~ experience + I(experience^2) + education + city,
  data = PSID1976, method = "2step")
gr_ml <- selection(participation ~ age + I(age^2) + fincome + education + kids, 
  wage ~ experience + I(experience^2) + education + city,
  data = PSID1976, method = "ml")
gr_ols <- lm(wage ~ experience + I(experience^2) + education + city, 
  data = PSID1976, subset = participation == "yes")
## NOTE: ML estimates agree with Greene, 5e errata. 
## Standard errors are based on the Hessian (here), while Greene has BHHH/OPG.



####################
## Ship accidents ##
####################

## subset data
data("ShipAccidents", package = "AER")
sa <- subset(ShipAccidents, service > 0)

## Table 21.20
sa_full <- glm(incidents ~ type + construction + operation, family = poisson,
  data = sa, offset = log(service))
summary(sa_full)

sa_notype <- glm(incidents ~ construction + operation, family = poisson,
  data = sa, offset = log(service))
summary(sa_notype)

sa_noperiod <- glm(incidents ~ type + operation, family = poisson,
  data = sa, offset = log(service))
summary(sa_noperiod)

## model comparison
anova(sa_full, sa_notype, test = "Chisq")
anova(sa_full, sa_noperiod, test = "Chisq")

## test for overdispersion
dispersiontest(sa_full)
dispersiontest(sa_full, trafo = 2)


######################################
## Fair's extramarital affairs data ##
######################################

## data
data("Affairs", package = "AER")

## Tab. 22.3 and 22.4
fm_ols <- lm(affairs ~ age + yearsmarried + religiousness + occupation + rating,
  data = Affairs)
fm_probit <- glm(I(affairs > 0) ~ age + yearsmarried + religiousness + occupation + rating,
  data = Affairs, family = binomial(link = "probit"))

fm_tobit <- tobit(affairs ~ age + yearsmarried + religiousness + occupation + rating,
  data = Affairs)
fm_tobit2 <- tobit(affairs ~ age + yearsmarried + religiousness + occupation + rating,
  right = 4, data = Affairs)

fm_pois <- glm(affairs ~ age + yearsmarried + religiousness + occupation + rating,
  data = Affairs, family = poisson)

library("MASS")
fm_nb <- glm.nb(affairs ~ age + yearsmarried + religiousness + occupation + rating,
  data = Affairs)

## Tab. 22.6
library("pscl")
fm_zip <- zeroinfl(affairs ~ age + yearsmarried + religiousness + occupation + rating | age + 
  yearsmarried + religiousness + occupation + rating, data = Affairs)


######################
## Strike durations ##
######################

## data and package
data("StrikeDuration", package = "AER")
library("MASS")

## Table 22.10
fit_exp <- fitdistr(StrikeDuration$duration, "exponential")
fit_wei <- fitdistr(StrikeDuration$duration, "weibull")
fit_wei$estimate[2]^(-1)
fit_lnorm <- fitdistr(StrikeDuration$duration, "lognormal")
1/fit_lnorm$estimate[2]
exp(-fit_lnorm$estimate[1])
## Weibull and lognormal distribution have
## different parameterizations, see Greene p. 794

## Example 22.10
library("survival")
fm_wei <- survreg(Surv(duration) ~ uoutput, dist = "weibull", data = StrikeDuration)
summary(fm_wei)



