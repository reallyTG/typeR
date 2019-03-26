## ---- eval=FALSE---------------------------------------------------------
#  install.packages("CausalImpact")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(CausalImpact)

## ------------------------------------------------------------------------
set.seed(1)
x1 <- 100 + arima.sim(model = list(ar = 0.999), n = 100)
y <- 1.2 * x1 + rnorm(100)
y[71:100] <- y[71:100] + 10
data <- cbind(y, x1)

## ------------------------------------------------------------------------
dim(data)
head(data)

## ---- eval=FALSE---------------------------------------------------------
#  matplot(data, type = "l")

## ---- echo=FALSE, fig.width=5, fig.height=2.8----------------------------
par(cex = 0.85, oma = c(0, 0, 0, 0), mar = c(3, 2, 1, 1))
matplot(data, type = "l", lwd = 1.5)

## ------------------------------------------------------------------------
pre.period <- c(1, 70)
post.period <- c(71, 100)

## ------------------------------------------------------------------------
impact <- CausalImpact(data, pre.period, post.period)

## ---- fig.width=8, fig.height=6, eval=FALSE------------------------------
#  plot(impact)

## ---- include=FALSE------------------------------------------------------
library(ggplot2)

## ---- echo=FALSE---------------------------------------------------------
q <- plot(impact) + theme_bw(base_size = 11)
suppressWarnings(plot(q))

## ------------------------------------------------------------------------
time.points <- seq.Date(as.Date("2014-01-01"), by = 1, length.out = 100)
data <- zoo(cbind(y, x1), time.points)
head(data)

## ------------------------------------------------------------------------
pre.period <- as.Date(c("2014-01-01", "2014-03-11"))
post.period <- as.Date(c("2014-03-12", "2014-04-10"))

## ---- fig.width=8, fig.height=6, eval=FALSE------------------------------
#  impact <- CausalImpact(data, pre.period, post.period)
#  plot(impact)

## ---- echo=FALSE---------------------------------------------------------
impact <- CausalImpact(data, pre.period, post.period)
q <- plot(impact) + theme_bw(base_size = 11)
suppressWarnings(plot(q))

## ------------------------------------------------------------------------
summary(impact)

## ---- eval=FALSE---------------------------------------------------------
#  summary(impact, "report")

## ---- eval=FALSE---------------------------------------------------------
#  impact$summary

## ---- eval=FALSE---------------------------------------------------------
#  impact <- CausalImpact(..., model.args = list(niter = 5000, nseasons = 7))

## ------------------------------------------------------------------------
post.period <- c(71, 100)
post.period.response <- y[post.period[1] : post.period[2]]
y[post.period[1] : post.period[2]] <- NA

## ---- echo=FALSE---------------------------------------------------------
ss <- AddLocalLevel(list(), y)
bsts.model <- bsts(y ~ x1, ss, niter = 1000, ping = 0)

## ---- eval=FALSE---------------------------------------------------------
#  ss <- AddLocalLevel(list(), y)
#  bsts.model <- bsts(y ~ x1, ss, niter = 1000)

## ------------------------------------------------------------------------
impact <- CausalImpact(bsts.model = bsts.model,
                       post.period.response = post.period.response)

## ---- eval=FALSE---------------------------------------------------------
#  plot(impact)
#  summary(impact)
#  summary(impact, "report")

## ---- eval=FALSE---------------------------------------------------------
#  plot(impact, c("original", "pointwise"))

## ---- eval=FALSE---------------------------------------------------------
#  library(ggplot2)
#  impact.plot <- plot(impact) + theme_bw(base_size = 20)
#  plot(impact.plot)

## ---- eval=FALSE---------------------------------------------------------
#  impact <- CausalImpact(data, pre.period, post.period, alpha = 0.1)

## ---- eval=FALSE---------------------------------------------------------
#  plot(impact$model$bsts.model, "coefficients")

## ---- include=FALSE------------------------------------------------------
# Get authors and copyright information.
description <- packageDescription("CausalImpact")
authors.markdown <- paste(format(as.person(description$Author),
                                 include = c("given", "family")),
                          sep = ", ")
copyright.markdown <- gsub("\\(C\\)", "\u00a9", description$Copyright)

