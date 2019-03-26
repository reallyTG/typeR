## ----setup, message = FALSE, warning = FALSE, echo=F---------------------
library(rprev)
library(survival)
library(ggplot2)
data(prevsim)

## ------------------------------------------------------------------------
inc <- test_homogeneity(prevsim$entrydate,
                        population_size=3.2e6,
                        truncate_end=TRUE)

## ------------------------------------------------------------------------
summary(inc)

## ----incidencerate, error = TRUE-----------------------------------------
inc$mean

## ---- fig.width = 7, fig.height = 4--------------------------------------
plot(inc)

## ----incidenceage, fig.width = 7, fig.height = 4, error = TRUE-----------
ggplot(prevsim, aes(age, y=..count..)) +
    geom_line(stat='density') +
    xlim(0, 100) +
    labs(x='Age (years)', y='Number incident cases') +
    theme_bw()

## ----survivaldiag, fig.width = 7, fig.height = 4-------------------------
km <- survfit(Surv(time, status) ~ 1, data=prevsim)
plot(km, lwd=2, col="blue", main="Overall Survival", xlab="Days", 
     ylab="Survival probability")

## ----survivaldiag2, fig.width = 7, fig.height = 4------------------------
ages = c(55, 65, 75, 85, 100)
km2 <- survfit(Surv(time, status) ~ cut(age, breaks=ages), data=prevsim)
plot(km2, lwd=2, col=1:length(ages), main="Survival stratified by age", xlab="Days", 
     ylab="Survival probability")
legend("topright", legend=substring(names(km2$strata), 25, 32), lty = 1, 
       col=1:length(ages))

## ----survivaldiag4, fig.width = 7, fig.height = 4, results='hide'--------
plot(km, lwd=2, col="blue", mark.time=F, conf.int=T, xlab="Days", 
     ylab="Survival probability")
num_reg_years <- 9
registry_years <- sapply(0:9, function(x) as.Date(paste0(2004+x, "-01-30")))
sapply(seq(num_reg_years),
       function(i) lines(survfit(Surv(time, status) ~ 1, 
                                 data=prevsim[prevsim$entrydate >= 
                                                          registry_years[i] & 
                                                          prevsim$entrydate < 
                                                          registry_years[i + 1], ]), 
                         mark.time = F, conf.int = F))

## ----survivaldiag3, fig.width = 7, fig.height = 4------------------------
cx <- coxph(Surv(time, status) ~ age, data=prevsim)
cxp <- survfit(cx, 
               newdata=data.frame(age=sapply(seq(length(ages) - 1), 
                                             function(i) mean(c(ages[i], ages[i + 1]))))) 
plot(cox.zph(cx))
lines(cxp, lwd=2, col=1:length(ages), lty=2, mark.time=F)


## ------------------------------------------------------------------------
cox.zph(cx)

## ----ageform3, warning=F, message=F, fig.width = 7, fig.height = 4, error = TRUE----
library(rms)
library(dplyr)

mod_spline <- cph(Surv(time, status) ~ rcs(age, df=4), prevsim, x=TRUE, y=TRUE, surv=TRUE, time.inc=1)

# Calculates log hazard linear predictor at 100 linearly separated ages between the limits
# in the registr data
age_range <- seq(min(prevsim$age), max(prevsim$age), length.out=100)
preds <- predict(mod_spline, newdata=age_range, se.fit=T)
preds_df <- as.data.frame(preds) %>%
                rename(lp=linear.predictors, se=se.fit) %>%
                mutate(age = age_range,
                       upper = lp + 2 * se,
                       lower = lp - 2 * se)

ggplot(preds_df, aes(x=age, y=lp)) +
    geom_ribbon(aes(ymin=lower, ymax=upper),
                     colour='#d2d2d2', alpha=0.30) +
    geom_line(colour='#0080ff', size=1.2) +
    theme_bw() +
    labs(x='Age', y='Log relative hazard')

## ------------------------------------------------------------------------
mod_spline

## ----prevalencetotal, error = TRUE---------------------------------------
prevalence_total <- prevalence(index='2013-01-30', 
                               num_years_to_estimate=c(3, 5, 10, 20), 
                               data=prevsim, 
                               inc_formula = entrydate ~ sex,
                               surv_formula = Surv(time, status) ~ age + sex, 
                               dist='weibull', 
                               population_size = 1e6,
                               death_column = 'eventdate')

## ------------------------------------------------------------------------
prevalence_total$pval

## ----test, error = TRUE--------------------------------------------------
test_prevalence_fit(prevalence_total)

## ------------------------------------------------------------------------
prevsurv <- survfit(prevalence_total, newdata=data.frame(age=60, sex='M'))
prevsurv

## ------------------------------------------------------------------------
summary(prevsurv, years=c(1, 3, 5, 10))

## ---- fig.width=7, fig.height=4------------------------------------------
plot(prevsurv)

## ------------------------------------------------------------------------
knitr::kable(head(prevalence_total$simulated))

