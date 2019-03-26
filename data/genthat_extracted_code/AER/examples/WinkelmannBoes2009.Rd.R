library(AER)


### Name: WinkelmannBoes2009
### Title: Data and Examples from Winkelmann and Boes (2009)
### Aliases: WinkelmannBoes2009
### Keywords: datasets

### ** Examples

#########################################
## US General Social Survey 1974--2002 ##
#########################################

## data
data("GSS7402", package = "AER")

## completed fertility subset
gss40 <- subset(GSS7402, age >= 40)


## Chapter 1
## Table 1.1
gss_kids <- table(gss40$kids)
cbind(absolute = gss_kids,
  relative = round(prop.table(gss_kids) * 100, digits = 2))

## Table 1.2
sd1 <- function(x) sd(x) / sqrt(length(x))
with(gss40, round(cbind(
  "obs"            = tapply(kids, year, length),
  "av kids"        = tapply(kids, year, mean),
  " " =              tapply(kids, year, sd1),
  "prop childless" = tapply(kids, year, function(x) mean(x <= 0)),
   " " =             tapply(kids, year, function(x) sd1(x <= 0)),
  "av schooling"   = tapply(education, year, mean),
   " " =             tapply(education, year, sd1)
), digits = 2))

## Table 1.3
gss40$trend <- gss40$year - 1974
kids_lm1 <- lm(kids ~ factor(year), data = gss40)
kids_lm2 <- lm(kids ~ trend, data = gss40)
kids_lm3 <- lm(kids ~ trend + education, data = gss40)


## Chapter 2
## Table 2.1
kids_tab <- prop.table(xtabs(~ kids + year, data = gss40), 2) * 100
round(kids_tab[,c(4, 8)], digits = 2)
## Figure 2.1
barplot(t(kids_tab[, c(4, 8)]), beside = TRUE, legend = TRUE)


## Chapter 3, Example 3.14
## Table 3.1
gss40$nokids <- factor(gss40$kids <= 0,
  levels = c(FALSE, TRUE), labels = c("no", "yes"))
nokids_p1 <- glm(nokids ~ 1, data = gss40, family = binomial(link = "probit"))
nokids_p2 <- glm(nokids ~ trend, data = gss40, family = binomial(link = "probit"))
nokids_p3 <- glm(nokids ~ trend + education + ethnicity + siblings,
  data = gss40, family = binomial(link = "probit"))

## p. 87
lrtest(nokids_p1, nokids_p2, nokids_p3)

## Chapter 4, Example 4.1
gss40$nokids01 <- as.numeric(gss40$nokids) - 1
nokids_lm3 <- lm(nokids01 ~ trend + education + ethnicity + siblings, data = gss40)
coeftest(nokids_lm3, vcov = sandwich)

## Example 4.3
## Table 4.1
nokids_l1 <- glm(nokids ~ 1, data = gss40, family = binomial(link = "logit"))
nokids_l3 <- glm(nokids ~ trend + education + ethnicity + siblings,
  data = gss40, family = binomial(link = "logit"))
lrtest(nokids_p3)
lrtest(nokids_l3)

## Table 4.2
nokids_xbar <- colMeans(model.matrix(nokids_l3))
sum(coef(nokids_p3) * nokids_xbar)
sum(coef(nokids_l3) * nokids_xbar)
dnorm(sum(coef(nokids_p3) * nokids_xbar))
dlogis(sum(coef(nokids_l3) * nokids_xbar))
dnorm(sum(coef(nokids_p3) * nokids_xbar)) * coef(nokids_p3)[3]
dlogis(sum(coef(nokids_l3) * nokids_xbar)) * coef(nokids_l3)[3]
exp(coef(nokids_l3)[3])

## Figure 4.4
## everything by hand (for ethnicity = "cauc" group)
nokids_xbar <- as.vector(nokids_xbar)
nokids_nd <- data.frame(education = seq(0, 20, by = 0.5), trend = nokids_xbar[2],
  ethnicity = "cauc", siblings = nokids_xbar[4])
nokids_p3_fit <- predict(nokids_p3, newdata = nokids_nd,
  type = "response", se.fit = TRUE)
plot(nokids_nd$education, nokids_p3_fit$fit, type = "l", 
  xlab = "education", ylab = "predicted probability", ylim = c(0, 0.3))
polygon(c(nokids_nd$education, rev(nokids_nd$education)),
  c(nokids_p3_fit$fit + 1.96 * nokids_p3_fit$se.fit,
  rev(nokids_p3_fit$fit - 1.96 * nokids_p3_fit$se.fit)),
  col = "lightgray", border = "lightgray")
lines(nokids_nd$education, nokids_p3_fit$fit)

## using "effects" package (for average "ethnicity" variable)
library("effects")
nokids_p3_ef <- effect("education", nokids_p3, xlevels = list(education = 0:20))
plot(nokids_p3_ef, rescale.axis = FALSE, ylim = c(0, 0.3))

## using "effects" plus modification by hand
nokids_p3_ef1 <- as.data.frame(nokids_p3_ef)
plot(pnorm(fit) ~ education, data = nokids_p3_ef1, type = "n", ylim = c(0, 0.3))
polygon(c(0:20, 20:0), pnorm(c(nokids_p3_ef1$upper, rev(nokids_p3_ef1$lower))),
  col = "lightgray", border = "lightgray")
lines(pnorm(fit) ~ education, data = nokids_p3_ef1)

## Table 4.6
## McFadden's R^2
1 - as.numeric( logLik(nokids_p3) / logLik(nokids_p1) )
1 - as.numeric( logLik(nokids_l3) / logLik(nokids_l1) )
## McKelvey and Zavoina R^2
r2mz <- function(obj) {
  ystar <- predict(obj)
  sse <- sum((ystar - mean(ystar))^2)
  s2 <- switch(obj$family$link, "probit" = 1, "logit" = pi^2/3, NA)
  n <- length(residuals(obj))
  sse / (n * s2 + sse)
}
r2mz(nokids_p3)
r2mz(nokids_l3)
## AUC
library("ROCR")
nokids_p3_pred <- prediction(fitted(nokids_p3), gss40$nokids)
nokids_l3_pred <- prediction(fitted(nokids_l3), gss40$nokids)
plot(performance(nokids_p3_pred, "tpr", "fpr"))
abline(0, 1, lty = 2)
performance(nokids_p3_pred, "auc")
plot(performance(nokids_l3_pred, "tpr", "fpr"))
abline(0, 1, lty = 2)
performance(nokids_l3_pred, "auc")@y.values

## Chapter 7
## Table 7.3
## subset selection
gss02 <- subset(GSS7402, year == 2002 & (age < 40 | !is.na(agefirstbirth)))
#Z# This selection conforms with top of page 229. However, there
#Z# are too many observations: 1374. Furthermore, there are six
#Z# observations with agefirstbirth <= 14 which will cause problems in
#Z# taking logs!

## computing time to first birth
gss02$tfb <- with(gss02, ifelse(is.na(agefirstbirth), age - 14, agefirstbirth - 14))
#Z# currently this is still needed before taking logs
gss02$tfb <- pmax(gss02$tfb, 1)

tfb_tobit <- tobit(log(tfb) ~ education + ethnicity + siblings + city16 + immigrant,
  data = gss02, left = -Inf, right = log(gss02$age - 14))
tfb_ols <- lm(log(tfb) ~ education + ethnicity + siblings + city16 + immigrant,
  data = gss02, subset = !is.na(agefirstbirth))

## Chapter 8
## Example 8.3
gss2002 <- subset(GSS7402, year == 2002 & (agefirstbirth < 40 | age < 40))
gss2002$afb <- with(gss2002, Surv(ifelse(kids > 0, agefirstbirth, age), kids > 0))
afb_km <- survfit(afb ~ 1, data = gss2002)
afb_skm <- summary(afb_km)
print(afb_skm)
with(afb_skm, plot(n.event/n.risk ~ time, type = "s"))
plot(afb_km, xlim = c(10, 40), conf.int = FALSE)

## Example 8.9
library("survival")
afb_ex <- survreg(
  afb ~ education + siblings + ethnicity + immigrant + lowincome16 + city16,
  data = gss2002, dist = "exponential")
afb_wb <- survreg(
  afb ~ education + siblings + ethnicity + immigrant + lowincome16 + city16,
  data = gss2002, dist = "weibull")
afb_ln <- survreg(
  afb ~ education + siblings + ethnicity + immigrant + lowincome16 + city16,
  data = gss2002, dist = "lognormal")

## Example 8.11
kids_pois <- glm(kids ~ education + trend + ethnicity + immigrant + lowincome16 + city16,
  data = gss40, family = poisson)
library("MASS")
kids_nb <- glm.nb(kids ~ education + trend + ethnicity + immigrant + lowincome16 + city16,
  data = gss40)
lrtest(kids_pois, kids_nb)


############################################
## German Socio-Economic Panel 1994--2002 ##
############################################

## data
data("GSOEP9402", package = "AER")

## some convenience data transformations
gsoep <- GSOEP9402
gsoep$meducation2 <- cut(gsoep$meducation, breaks = c(6, 10.25, 12.25, 18),
  labels = c("7-10", "10.5-12", "12.5-18"))
gsoep$year2 <- factor(gsoep$year)

## Chapter 1
## Table 1.4 plus visualizations
gsoep_tab <- xtabs(~ meducation2 + school, data = gsoep)
round(prop.table(gsoep_tab, 1) * 100, digits = 2)
spineplot(gsoep_tab)
plot(school ~ meducation, data = gsoep, breaks = c(7, 10.25, 12.25, 18))
plot(school ~ meducation, data = gsoep, breaks = c(7, 9, 10.5, 11.5, 12.5, 15, 18))


## Chapter 5
## Table 5.1
library("nnet")
gsoep_mnl <- multinom(
  school ~ meducation + memployment + log(income) + log(size) + parity + year2,
  data = gsoep)
coeftest(gsoep_mnl)[c(1:6, 1:6 + 14),]
 
## alternatively
if(require("mlogit")) {
gsoep_mnl2 <- mlogit(school ~ 0 | meducation + memployment + log(income) +
  log(size) + parity + year2, data = gsoep, shape = "wide", reflevel = "Hauptschule")
coeftest(gsoep_mnl2)[1:12,]
}

## Table 5.2
library("effects")
gsoep_eff <- effect("meducation", gsoep_mnl,
  xlevels = list(meducation = sort(unique(gsoep$meducation))))
gsoep_eff$prob
plot(gsoep_eff, confint = FALSE)

## Table 5.3, odds
exp(coef(gsoep_mnl)[, "meducation"])

## all effects
eff_mnl <- allEffects(gsoep_mnl)
plot(eff_mnl, ask = FALSE, confint = FALSE)
plot(eff_mnl, ask = FALSE, style = "stacked", colors = gray.colors(3))

## omit year
gsoep_mnl1 <- multinom(
  school ~ meducation + memployment + log(income) + log(size) + parity,
  data = gsoep)
lrtest(gsoep_mnl, gsoep_mnl1)
eff_mnl1 <- allEffects(gsoep_mnl1)
plot(eff_mnl1, ask = FALSE, confint = FALSE)
plot(eff_mnl1, ask = FALSE, style = "stacked", colors = gray.colors(3))


## Chapter 6
## Table 6.1
library("MASS")
gsoep$munemp <- factor(gsoep$memployment != "none",
  levels = c(FALSE, TRUE), labels = c("no", "yes"))
gsoep_pop <- polr(school ~ meducation + munemp + log(income) + log(size) + parity + year2,
  data = gsoep, method = "probit", Hess = TRUE)
gsoep_pol <- polr(school ~ meducation + munemp + log(income) + log(size) + parity + year2,
  data = gsoep, Hess = TRUE)
lrtest(gsoep_pop)
lrtest(gsoep_pol)

## Table 6.2
## todo
eff_pol <- allEffects(gsoep_pol)
plot(eff_pol, ask = FALSE, confint = FALSE)
plot(eff_pol, ask = FALSE, style = "stacked", colors = gray.colors(3))


####################################
## Labor Force Participation Data ##
####################################

## Mroz data
data("PSID1976", package = "AER")
PSID1976$nwincome <- with(PSID1976, (fincome - hours * wage)/1000)

## visualizations
plot(hours ~ nwincome, data = PSID1976,
  xlab = "Non-wife income (in USD 1000)",
  ylab = "Hours of work in 1975")

plot(jitter(hours, 200) ~ jitter(wage, 50), data = PSID1976,
  xlab = "Wife's average hourly wage (jittered)",
  ylab = "Hours of work in 1975 (jittered)")

## Chapter 1, p. 18
hours_lm <- lm(hours ~ wage + nwincome + youngkids + oldkids, data = PSID1976,
  subset = participation == "yes")

## Chapter 7
## Example 7.2, Table 7.1
hours_tobit <- tobit(hours ~ nwincome + education + experience + I(experience^2) +
  age + youngkids + oldkids, data = PSID1976)
hours_ols1 <- lm(hours ~ nwincome + education + experience + I(experience^2) +
  age + youngkids + oldkids, data = PSID1976)
hours_ols2 <- lm(hours ~ nwincome + education + experience + I(experience^2) +
  age + youngkids + oldkids, data = PSID1976, subset = participation == "yes")

## Example 7.10, Table 7.4
wage_ols <- lm(log(wage) ~ education + experience + I(experience^2),
  data = PSID1976, subset = participation == "yes")

library("sampleSelection")
wage_ghr <- selection(participation ~ nwincome + age + youngkids + oldkids +
  education + experience + I(experience^2), 
  log(wage) ~ education + experience + I(experience^2), data = PSID1976)

## Exercise 7.13
hours_cragg1 <- glm(participation ~ nwincome + education +
  experience + I(experience^2) + age + youngkids + oldkids,
  data = PSID1976, family = binomial(link = "probit"))
library("truncreg")
hours_cragg2 <- truncreg(hours ~ nwincome + education +
  experience + I(experience^2) + age + youngkids + oldkids,
  data = PSID1976, subset = participation == "yes")

## Exercise 7.15
wage_olscoef <- sapply(c(-Inf, 0.5, 1, 1.5, 2), function(censpoint)
  coef(lm(log(wage) ~ education + experience + I(experience^2),
  data = PSID1976[log(PSID1976$wage) > censpoint,])))
wage_mlcoef <- sapply(c(0.5, 1, 1.5, 2), function(censpoint)
  coef(tobit(log(wage) ~ education + experience + I(experience^2),
  data = PSID1976, left = censpoint)))


##################################
## Choice of Brand for Crackers ##
##################################

## data
if(require("mlogit")) {
data("Cracker", package = "mlogit")
head(Cracker, 3)
crack <- mlogit.data(Cracker, varying = 2:13, shape = "wide", choice = "choice")
head(crack, 12)

## Table 5.6 (model 3 probably not fully converged in W&B)
crack$price <- crack$price/100
crack_mlogit1 <- mlogit(choice ~ price | 0, data = crack, reflevel = "private")
crack_mlogit2 <- mlogit(choice ~ price | 1, data = crack, reflevel = "private")
crack_mlogit3 <- mlogit(choice ~ price + feat + disp | 1, data = crack,
  reflevel = "private")
lrtest(crack_mlogit1, crack_mlogit2, crack_mlogit3)

## IIA test
crack_mlogit_all <- update(crack_mlogit2, reflevel = "nabisco")
crack_mlogit_res <- update(crack_mlogit_all,
  alt.subset = c("keebler", "nabisco", "sunshine"))
hmftest(crack_mlogit_all, crack_mlogit_res)
}



