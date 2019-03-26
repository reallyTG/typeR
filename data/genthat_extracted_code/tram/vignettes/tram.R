## ----setup, echo = FALSE, results = "hide", message = FALSE--------------
set.seed(290875)

sapply(c("tram", "survival", "MASS", "lattice", "mlbench", 
         "multcomp", "ordinal", "colorspace", "quantreg", "trtf", "ATR"), library, char = TRUE)


trellis.par.set(list(plot.symbol = list(col=1,pch=20, cex=0.7),
                     box.rectangle = list(col=1),
                     box.umbrella = list(lty=1, col=1),
                     strip.background = list(col = "white")))
ltheme <- canonical.theme(color = FALSE)     ## in-built B&W theme
ltheme$strip.background$col <- "transparent" ## change strip bg
lattice.options(default.theme = ltheme)

knitr::opts_chunk$set(echo = TRUE, results = 'markup', error = FALSE,
                      warning = FALSE, message = FALSE,
                      tidy = FALSE, cache = FALSE, size = "small",
                      fig.width = 6, fig.height = 4, fig.align = "center",
                      out.width = NULL, ###'.6\\linewidth', 
                      out.height = NULL,
                      fig.scap = NA)
knitr::render_sweave()  # use Sweave environments
knitr::set_header(highlight = '')  # do not \usepackage{Sweave}
## R settings
options(prompt = "R> ", continue = "+  ", useFancyQuotes = FALSE)  # JSS style
options(width = 75)
library("colorspace")
col <- diverge_hcl(2, h = c(246, 40), c = 96, l = c(65, 90))
fill <- diverge_hcl(2, h = c(246, 40), c = 96, l = c(65, 90), alpha = .3)

## ----citation, echo = FALSE----------------------------------------------
year <- substr(packageDescription("tram")$Date, 1, 4)
version <- packageDescription("tram")$Version

## ----tram, echo = TRUE, eval = FALSE-------------------------------------
#  tram(y | s ~ x, ...)

## ----BostonHousing-lm----------------------------------------------------
data("BostonHousing2", package = "mlbench")
lm_BH <- lm(cmedv ~ crim + zn + indus + chas + nox + rm + age + dis + 
            rad + tax + ptratio + b + lstat, data = BostonHousing2)

## ----BostonHousing-numeric, echo = FALSE---------------------------------
BostonHousing2$rad <- as.numeric(BostonHousing2$rad)
BostonHousing2$tax <- as.numeric(BostonHousing2$tax)

## ----BostonHousing-Lm1, cache = TRUE-------------------------------------
Lm_BH_1 <- Lm(cmedv ~ crim + zn + indus + chas + nox + rm + age + dis + 
              rad + tax + ptratio + b + lstat, data = BostonHousing2)

## ----BostonHousing-logLik------------------------------------------------
logLik(lm_BH)
logLik(Lm_BH_1)

## ----BostonHousing-coef--------------------------------------------------
coef(lm_BH)
coef(Lm_BH_1, as.lm = TRUE)

## ----BostonHousing-sd----------------------------------------------------
summary(lm_BH)$sigma
1 / coef(Lm_BH_1, with_baseline = TRUE)["cmedv"]

## ----BostonHousing-Lm2, cache = TRUE-------------------------------------
BostonHousing2$y <- with(BostonHousing2, Surv(cmedv, cmedv < 50))
Lm_BH_2 <- Lm(y ~ crim + zn + indus + chas + nox + 
              rm + age + dis + rad + tax + ptratio + b + lstat, 
              data = BostonHousing2)
logLik(Lm_BH_2)

## ----BostonHousing-Lm3, cache = TRUE-------------------------------------
Lm_BH_3 <- Lm(y | 0 + chas ~ crim + zn + indus + nox + 
              rm + age + dis + rad + tax + ptratio + b + lstat, 
              data = BostonHousing2)
logLik(Lm_BH_3)

## ----BostonHousing-chas-coef---------------------------------------------
1 / coef(Lm_BH_3, with_baseline = TRUE)[c(2, 4)]

## ----BostonHousing-chas-glht---------------------------------------------
summary(glht(as.mlt(Lm_BH_3), linfct = c("y:chas0 - y:chas1 = 0")))

## ----BostonHousing-Lm4, cache = TRUE-------------------------------------
Lm_BH_4 <- Lm(y | 0 + chas + crim + zn + indus + nox + 
              rm + age + dis + rad + tax + ptratio + b + lstat ~ 0, 
              data = BostonHousing2)
logLik(Lm_BH_4)

## ----BostonHousing-BC-1, cache = TRUE------------------------------------
BC_BH_1 <- BoxCox(y ~ chas + crim + zn + indus + nox + 
                  rm + age + dis + rad + tax + ptratio + b + lstat, 
                  data = BostonHousing2)
logLik(BC_BH_1)

## ----BostonHousing-BC-1-plot---------------------------------------------
nd <- model.frame(BC_BH_1)[1,-1,drop = FALSE]
plot(BC_BH_1, which = "baseline only", newdata = nd, col = col,
     confidence = "interval", fill = fill, lwd = 2,
     xlab = "Median Value", ylab = expression(h[Y]))

## ----BostonHousing-BC-2, cache = TRUE------------------------------------
BC_BH_2 <- BoxCox(y | 0 + chas ~ crim + zn + indus + nox + 
                  rm + age + dis + rad + tax + ptratio + b + lstat, 
                  data = BostonHousing2)
logLik(BC_BH_2)

## ----BostonHousing-BC-2-plot---------------------------------------------
nd <- model.frame(BC_BH_2)[1:2, -1]
nd$chas <- factor(c("0", "1"))
plot(BC_BH_2, which = "baseline only", newdata = nd, col = col,
     confidence = "interval", fill = fill, lwd = 2,
     xlab = "Median Value", ylab = expression(h[Y]))
legend("bottomright", lty = 1, col = col, 
       title = "Near Charles River", legend = c("no", "yes"), bty = "n")

## ----BostonHousing-Lm-3-plot---------------------------------------------
plot(Lm_BH_3, which = "baseline only", newdata = nd, col = col,
     confidence = "interval", fill = fill, lwd = 2)
legend("bottomright", lty = 1, col = col, 
       title = "Near Charles River", legend = c("no", "yes"), bty = "n")

## ----BostonHousing-BC-3, eval = FALSE------------------------------------
#  BoxCox(y | 0 + chas + crim + zn + indus + nox +
#         rm + age + dis + rad + tax + ptratio + b + lstat ~ 0,
#         data = BostonHousing2)

## ----BostonHousing-Colr-1, cache = TRUE----------------------------------
Colr_BH_1 <- Colr(y | 0 + chas ~ crim + zn + indus + nox + 
                  rm + age + dis + rad + tax + ptratio + b + lstat, 
                  data = BostonHousing2)
logLik(Colr_BH_1)

## ----BostonHousing-Colr-CI, cache = TRUE---------------------------------
round(cbind(exp(coef(Colr_BH_1)), exp(confint(Colr_BH_1))), 3)

## ----BostonHousing-Colr-1-plot, echo = FALSE-----------------------------
nd <- BostonHousing2
nd$y <- NULL
q <- 0:50
d <- predict(Colr_BH_1, newdata = nd, q = q, which = "distribution", type="distribution")
lp <- c(predict(Colr_BH_1, newdata = nd, type = "lp"))
nd2 <- expand.grid(q = q, lp = -lp)
nd2$d <- c(d)
nd2$chas <- rep(nd$chas, rep(length(q), length(lp)))
BHtmp <- BostonHousing2
levels(BHtmp$chas) <- levels(nd2$chas) <- levels(nd$chas) <- c("Off Charles River", "Near Charles River")
pfun <- function(x, y, z, subscripts, at, ...) {
    panel.contourplot(x, y, z, subscripts, at = 1:9/10, ...)
    ch <- as.character(unique(nd2$chas[subscripts]))
    panel.xyplot(x = -lp[nd$chas == ch], y = subset(BHtmp, chas == ch)$cmedv, pch = 20, 
                 col = rgb(.1, .1, .1, .2))   
}
plot(contourplot(d ~ lp + q | chas, data = nd2, panel = pfun, xlab = "Linear predictor", 
     ylab = "Median Value", col = col[1]))#, main = "Continuous Outcome Logistic Regression"))

## ----BostonHousing-rq-1, cache = TRUE------------------------------------
tau <- 2:18 / 20
fm <- cmedv ~ crim + zn + indus + chas + nox + rm + age + dis + 
              rad + tax + ptratio + b + lstat
rq_BH_1 <- lapply(tau, function(p) rq(fm, data = BostonHousing2, tau = p))
Colr_BH_2 <- Colr(cmedv | crim + zn + indus + chas + nox + rm + age + dis + 
                  rad + tax + ptratio + b + lstat ~ 0, 
                  data = BostonHousing2, order = 2)

## ----BostonHousing-rq-1-plot, echo = FALSE, fig.width = 9, fig.height = 9----
idx <- order(BostonHousing2$cmedv)[ceiling(1:9/10 * NROW(BostonHousing2))]
layout(matrix(1:9, nrow = 3))
for (i in idx) {
  qrq <- sapply(rq_BH_1, function(x) predict(x, newdata = BostonHousing2[i,]))
  nd <- BostonHousing2[i,]
  nd$cmedv <- NULL
  plot(Colr_BH_2, newdata = nd, which = "distribution", type = "distribution", 
       q = 5:36, main = paste("Obs.", i), ylab = "Distribution", xlab =
       "Median Value", col = col[1], lwd = 2)
  points(qrq, tau, type = "b", col = col[2], cex = 1.5)
  arrows(BostonHousing2[i, "cmedv"], 0, BostonHousing2[i, "cmedv"], .2,
         length = .15, angle = 15)
#  abline(v = BostonHousing2[i, "cmedv"])
}

## ----GBSG2-Weibull-1, cache = TRUE---------------------------------------
data("GBSG2", package = "TH.data")
Survreg_GBSG2_1 <- Survreg(Surv(time, cens) ~ horTh, data = GBSG2)
logLik(Survreg_GBSG2_1)
survreg_GBSG2_1 <- survreg(Surv(time, cens) ~ horTh, data = GBSG2)
logLik(survreg_GBSG2_1)

## ----GBSG2-Weibull-coef--------------------------------------------------
c(coef(Survreg_GBSG2_1),
  coef(survreg_GBSG2_1)["horThyes"] / survreg_GBSG2_1$scale)

## ----GBSG2-Weibull-ci----------------------------------------------------
exp(-rev(confint(Survreg_GBSG2_1)))

## ----GBSG2-Weibull-1-plot------------------------------------------------
nd <- data.frame(horTh = factor(c("no", "yes")))
plot(Survreg_GBSG2_1, newdata = nd, which = "distribution", 
     type = "survivor", confidence = "interval", fill = fill, 
     col = col, ylab = "Probability", xlab = "Survival Time")
legend("bottomleft", lty = 1, title = "Hormonal Therapy", 
       legend = levels(nd$horTh), bty = "n", col = col)

## ----GBSG2-Weibull-2, cache = TRUE---------------------------------------
Survreg_GBSG2_2 <- Survreg(Surv(time, cens) | 0 + horTh ~ 1, data = GBSG2)
logLik(Survreg_GBSG2_2)
survreg_GBSG2_2 <- survreg(Surv(time, cens) ~ strata(horTh) + horTh - 1, 
                           data = GBSG2)
logLik(survreg_GBSG2_2)
coef(Survreg_GBSG2_2, with_baseline = TRUE)
c(1 / survreg_GBSG2_2$scale, -coef(survreg_GBSG2_2) / 
                              survreg_GBSG2_2$scale)

## ----GBSG2-Cox-1, cache = TRUE-------------------------------------------
Coxph_GBSG2_1 <- Coxph(Surv(time, cens) ~ horTh, data = GBSG2)
logLik(Coxph_GBSG2_1)
coef(Coxph_GBSG2_1)

## ----GBSG2-Cox-2, cache = TRUE-------------------------------------------
Coxph_GBSG2_2 <- Coxph(Surv(time, cens) | 0 + horTh ~ 1 , data = GBSG2)
logLik(Coxph_GBSG2_2)

## ----GBSG2-Cox-1-plot----------------------------------------------------
plot(survfit(Surv(time, cens) ~ horTh, data = GBSG2), col = col, 
     ylab = "Probability", xlab = "Survival Time")
plot(Coxph_GBSG2_1, newdata = nd, which = "distribution", 
     type = "survivor", col = col, add = TRUE, lty = 1)
plot(Coxph_GBSG2_2, newdata = nd, which = "distribution", 
     type = "survivor", col = col, add = TRUE, lty = 2)
legend("bottomleft", lty = 1, title = "Hormonal Therapy", 
       legend = levels(nd$horTh), bty = "n", col = col)

## ----wine-polr-----------------------------------------------------------
data("wine", package = "ordinal")
polr_wine <- polr(rating ~ temp + contact, data = wine)
logLik(polr_wine)
coef(polr_wine)

## ----wine-clm-1, cache = TRUE--------------------------------------------
clm_wine_1 <- clm(rating ~ temp + contact, data = wine)
logLik(clm_wine_1)
coef(clm_wine_1)

## ----wine-Polr-1, cache = TRUE-------------------------------------------
Polr_wine_1 <- Polr(rating ~ temp + contact, data = wine)
logLik(Polr_wine_1)
coef(Polr_wine_1, with_baseline = TRUE)

## ----wine-clm-2, cache = TRUE--------------------------------------------
clm_wine_2 <- clm(rating ~ temp, nominal = ~ contact, data = wine)
logLik(clm_wine_2)
coef(clm_wine_2)

## ----wine-Polr-2, cache = TRUE-------------------------------------------
Polr_wine_2 <- Polr(rating | 1 + contact ~ temp, data = wine)
logLik(Polr_wine_2)
coef(Polr_wine_2, with_baseline = TRUE)

## ----wine-clm-3, cache = TRUE--------------------------------------------
clm_wine_3 <- clm(rating ~ temp, nominal = ~ contact, data = wine, 
                  link = "probit")
logLik(clm_wine_3)
coef(clm_wine_3)

## ----wine-Polr-3, cache = TRUE-------------------------------------------
Polr_wine_3 <- Polr(rating | 1 + contact ~ temp, data = wine, 
                    method = "probit")
logLik(Polr_wine_3)
coef(clm_wine_3)

## ----wine-censored-------------------------------------------------------
erating <- wine$rating
lrating <- erating
rrating <- erating
l9 <- lrating[wine$judge == 9] 
l9[l9 > 1] <- levels(l9)[unclass(l9[l9 > 1]) - 1]
r9 <- rrating[wine$judge == 9] 
r9[r9 < 5] <- levels(r9)[unclass(r9[r9 < 5]) + 1]
lrating[wine$judge != 9] <- rrating[wine$judge != 9] <- NA
erating[wine$judge == 9] <- NA
lrating[wine$judge == 9] <- l9
rrating[wine$judge == 9] <- r9
which(wine$judge == 9)
(wine$crating <- R(erating, cleft = lrating, cright = rrating))

## ----wine-censored-Polr, echo = TRUE-------------------------------------
Polr_wine_4 <- Polr(crating | contact ~ temp, data = wine, 
                    method = "probit")
logLik(Polr_wine_4)
coef(Polr_wine_4)

## ----BostonHousing-BC-4-0, cache = TRUE----------------------------------
BC_BH_0 <- BoxCox(y ~ 1, data = BostonHousing2)
logLik(BC_BH_0)

## ----BostonHousing-BC-4, cache = TRUE------------------------------------
library("trtf")
BC_BH_4 <- trafotree(BC_BH_0, 
    formula = y ~ chas + crim + zn + indus + nox + 
              rm + age + dis + rad + tax + ptratio + b + lstat, data =
    BostonHousing2, control = ctree_control(minbucket = 30))
logLik(BC_BH_4)

## ----BostonHousing-BC-4-plot, fig.width = 14, fig.height = 10, echo = FALSE----
library("ATR")
plot(rotate(BC_BH_4), terminal_panel = trtf:::node_mlt, 
     tp_args = list(type = "density", K = 100, fill = col[1], id = FALSE))

## ----BostonHousing-BC-5, eval = FALSE------------------------------------
#  BC_BH_5 <- traforest(BC_BH_0,
#      formula = y ~ chas + crim + zn + indus + nox +
#                rm + age + dis + rad + tax + ptratio + b + lstat, data =
#      BostonHousing2)

## ----GBSG2-Cox-3-0-------------------------------------------------------
Coxph_GBSG2_1 <- Coxph(Surv(time, cens) ~ horTh, data = GBSG2)
logLik(Coxph_GBSG2_1)
coef(Coxph_GBSG2_1)

## ----GBSG2-Cox-3---------------------------------------------------------
Coxph_GBSG2_3 <- trafotree(Coxph_GBSG2_1, 
    formula = Surv(time, cens) ~ horTh | age + menostat + tsize + 
                                 tgrade + pnodes + progrec + estrec, 
    data = GBSG2)
logLik(Coxph_GBSG2_3)
coef(Coxph_GBSG2_3)[, "horThyes"]

## ----GBSG2-Cox-3-plot----------------------------------------------------
nd <- data.frame(horTh = sort(unique(GBSG2$horTh)))
plot(Coxph_GBSG2_3, newdata = nd, 
     tp_args = list(type = "survivor", col = col))

## ----GBSG2-Cox-4---------------------------------------------------------
GBSG2$int <- 1
Coxph_GBSG2_3 <- Coxph(Surv(time, cens) ~ int + horTh, data = GBSG2, 
                       fixed = c("int" = 0))
(Coxph_GBSG2_4 <- trafotree(Coxph_GBSG2_3, 
    formula = Surv(time, cens) ~ int + horTh | age + menostat + tsize + 
                                 tgrade + pnodes + progrec + estrec, 
    data = GBSG2, parm = c("int", "horThyes"), 
    mltargs = list(fixed = c("int" = 0))))
logLik(Coxph_GBSG2_4)
coef(Coxph_GBSG2_4)[, "horThyes"]

## ----GBSG2-Cox-5, cache = TRUE-------------------------------------------
ctrl <- ctree_control(minsplit = 30, minbucket = 15, mincriterion = 0)
Coxph_GBSG2_5 <- traforest(Coxph_GBSG2_1, 
    formula = Surv(time, cens) ~ horTh | age, control = ctrl, 
    ntree = 100, mtry = 1, data = GBSG2)

## ----GBSG2-Cox-5-plot, cache = TRUE--------------------------------------
nd <- data.frame(age = 30:70)
cf <- predict(Coxph_GBSG2_5, newdata = nd, type = "coef")
nd$logHR <- sapply(cf, function(x) x["horThyes"])
plot(logHR ~ age, data = nd, pch = 19, xlab = "Age", 
     ylab = "log-Hazard Ratio")
abline(h = coef(Coxph_GBSG2_1)["horThyes"])

## ----sessionInfo, echo = FALSE, results = "hide"-------------------------
sessionInfo()

