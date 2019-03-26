## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.align = 'center'
)

knitr::opts_knit$set(progress = FALSE)
library(JointAI)

## ----fit_lm1, message = F------------------------------------------------
lm1 <- lm_imp(SBP ~ gender + age + race + WC + alc + educ + albu + bili,
              data = NHANES, n.iter = 500, progress.bar = 'none')

## ----results_lm1, fig.width = 8, fig.height = 5, out.width = '100%'------
traceplot(lm1)

## ---- echo = FALSE------------------------------------------------------------
options(width = 80)

## -----------------------------------------------------------------------------
summary(lm1)

## ---- echo = F, fig.width = 8, fig.height = 2---------------------------------
par(mfrow = c(1, 3), mgp = c(1, 0.6, 0), mar = c(2.5, 1, 2, 1))
mus <- c(1, -1.5, -2.5)

for (i in seq_along(mus)) {
  x <- seq(-3.5, 3.5, length = 1000) + mus[i]
  y <- dnorm(x, mean = mus[i])
  
  plot(x,y, type  = 'l', yaxt = 'n', xaxt = 'n',
       xlab = expression(theta), ylab = "",
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

## ---- fig.width = 8, fig.height = 5-------------------------------------------
densplot(lm1)

