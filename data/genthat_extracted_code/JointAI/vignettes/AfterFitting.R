## ----setup, include = FALSE-----------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.align = 'center'
)
library(JointAI)
options(width = 100)

## ---- message = FALSE, fig.width = 7, fig.height = 4, out.width = '100%'--------------------------
mod13a <- lm_imp(SBP ~ gender + WC + alc +  creat, data = NHANES, n.iter = 500)

traceplot(mod13a)

## ----ggtrace15a, fig.width = 7, fig.height = 3.5, out.width = '100%'------------------------------
library(ggplot2)
traceplot(mod13a, ncol = 3, use_ggplot = TRUE) +
  theme(legend.position = 'bottom') +
  scale_color_brewer(palette = 'Dark2')

## ---- echo = F, eval = F, fig.width = 7, fig.height = 3.5, out.width = '100%'---------------------
#  densplot(mod13a, joined = TRUE, ncol = 3)

## ---- fig.width = 7, fig.height = 3.5, out.width = '100%'-----------------------------------------
densplot(mod13a, ncol = 3, col = c("darkred", "darkblue", "darkgreen"),
         vlines = list(list(v = rep(0, nrow(summary(mod13a)$stats)),
                            col = grey(0.8))))


## ----densplot15a, fig.width = 7, fig.height = 3.5, out.width = '100%'-----------------------------
densplot(mod13a, ncol = 3,
         vlines = list(list(v = summary(mod13a)$stats[, "Mean"], lty = 1,
                            lwd = 2),
                       list(v = summary(mod13a)$stats[, "2.5%"], lty = 2),
                       list(v = summary(mod13a)$stats[, "97.5%"], lty = 2)
         )
)

## ----ggdens15a, fig.width = 7, fig.height = 3.5, out.width = '100%'-------------------------------
# make a dataset containing the quantiles of the posterior sample:
library("reshape2")
quantDF <- melt(summary(mod13a)$stat[, c('2.5%', '97.5%')],
                varnames = c('variable', 'quantile'))

# fit the complete-case version of the model
mod13a_cc <- lm(SBP ~ gender + WC + alc +  creat, data = NHANES)

# make a dataset with coefficients and confidence intervals from the
# complete case analysis
ccDF <- data.frame(variable = c(names(coef(mod13a_cc)), 'sigma_SBP'),
                   coef = c(coef(mod13a_cc), summary(mod13a_cc)$sigma),
                   rbind(confint(mod13a_cc), c(NA, NA)),
                   stringsAsFactors = FALSE
)



# ggplot version, excluding tau_SBP from the plot:
p13a <- densplot(mod13a, ncol = 3, use_ggplot = TRUE, joined = TRUE,
                 subset = c(analysis_main = TRUE, tau_y = FALSE)) +
  theme(legend.position = 'bottom')


# add vertical lines for the:
# - coefficient from the compl. case analysis
# - confidence intervals from the compl. case analysis
# - quantiles of the posterior distribution

p13a +
  geom_vline(data = ccDF, aes(xintercept = coef, color = 'cc')) +
  geom_vline(data = ccDF, aes(xintercept = X2.5.., color = 'cc'),
             lty = 2, na.rm = T) +
  geom_vline(data = ccDF, aes(xintercept = X97.5.., color = 'cc'),
             lty = 2, na.rm = T) +
  geom_vline(data = subset(quantDF, variable != 'tau_SBP'),
                  aes(xintercept = value, color = 'JointAI'), lty = 2) +
  scale_color_manual(name = 'CI from model: ', 
                     limits = c('JointAI', 'cc'),
                     values = c('blue', 'red'),
                     labels = c('JointAI', 'compl.case'))

## ---- message = FALSE-----------------------------------------------------------------------------
summary(mod13a)

## ---- message = FALSE-----------------------------------------------------------------------------
library(splines)
mod13b <- lme_imp(bmi ~ GESTBIR + ETHN + HEIGHT_M + ns(age, df = 3),
                  random = ~ ns(age, df = 3) | ID, data = simLong,
                  n.iter = 250)

summary(mod13b)

## ----tailprob, echo = F, fig.width = 7, fig.height = 1.5, out.width = '100%'----------------------
par(mfrow = c(1, 3), mgp = c(1, 0.6, 0), mar = c(2.5, 1, 2, 1))
mus <- c(1, -1.5, -2.5)

for (i in seq_along(mus)) {
  x <- seq(-3.5, 3.5, length = 1000) + mus[i]
  y <- dnorm(x, mean = mus[i])
  
  plot(x,y, type  = 'l', yaxt = 'n', xaxt = 'n',
       xlab = expression(theta), ylab = "", cex.lab = 1.5,
       main = paste0('tail prob. = ', round(2*pnorm(0, abs(mus[i])), 3)))
  
  if (mus[i] > 0) {
    polygon(x = c(x[x < 0], max(x[x < 0])),
            y = c(y[x < 0], min(y)), col = "#18bc9c", border = NA)
  } else {
    polygon(x = c(x[x > 0], min(x[x > 0])),
            y = c(y[x > 0], min(y)), col = "#18bc9c", border = NA)
  }
  lines(x,y)
  axis(side = 1, at = 0)
  abline(v = 0, lty = 2)
}

## -------------------------------------------------------------------------------------------------
GR_crit(mod13a)

## -------------------------------------------------------------------------------------------------
MC_error(mod13a)

## ----MCE15a, fig.width = 8, fig.height = 3, out.width = '100%'------------------------------------
par(mar = c(3, 5, 0.5, 0.5), mgp = c(2, 0.6, 0), mfrow = c(1, 2))
plot(MC_error(mod13a))  # left panel
plot(MC_error(mod13a, end = 250))  # right panel

## ---- message = FALSE-----------------------------------------------------------------------------
mod13c <- update(mod13a, monitor_params = c(imp_pars = TRUE))
summary(mod13c, subset = c(analysis_main = FALSE, imp_pars = TRUE))

## ----message = FALSE, eval = FALSE----------------------------------------------------------------
#  densplot(mod13c, subset = list(other = c('creat', 'alc>=1')))

## ----trace15d, message = FALSE--------------------------------------------------------------------
# re-fit the model and monitor the imputed values
mod13d <- update(mod13a, monitor_params = c(imps = TRUE))

# select all imputed values for 'WC' (3rd column of Xc)
sub3 <- grep('Xc\\[[[:digit:]]+,3\\]', parameters(mod13d), value = TRUE)
sub3

# pass "sub3" to "subset" via "other", for example in a traceplot:
# traceplot(mod13d, subset = list(other = sub3), ncol = 2)

## ---- eval = FALSE--------------------------------------------------------------------------------
#  # re-fit the model monitoring the random effects
#  mod13e <- update(mod13b, monitor_params = c(ranef = TRUE))
#  
#  # exract random intercepts and random slopes
#  ri <- grep('^b\\[[[:digit:]]+,1\\]$', colnames(mod13e$MCMC[[1]]), value = T)
#  rs <- grep('^b\\[[[:digit:]]+,2\\]$', colnames(mod13e$MCMC[[1]]), value = T)
#  
#  # to plot the chains of 12 randomly selected random intercepts and slopes:
#  traceplot(mod13e, subset = list(other = sample(ri, size = 12)), ncol = 4)
#  traceplot(mod13e, subset = list(other = sample(rs, size = 12)), ncol = 4)

## ---- echo = FALSE--------------------------------------------------
options(width = 70)

## -------------------------------------------------------------------
predict(mod13a, newdata = NHANES[27, ])

## ---- fig.width = 6, fig.height = 4, out.width = '90%'--------------
# create dataset for prediction
newDF <- predDF(mod13b, var = "age")

# obtain predicted values
pred <- predict(mod13b, newdata = newDF)

# plot predicted values and prediction interval
matplot(pred$dat$age, pred$dat[, c('fit', '2.5%', '97.5%')],
        lty = c(1,2,2), type = 'l', col = 1,
        xlab = 'age in months', ylab = 'predicted value')


## -------------------------------------------------------------------
impDF <- get_MIdat(mod13d, m = 3, seed = 2018)

