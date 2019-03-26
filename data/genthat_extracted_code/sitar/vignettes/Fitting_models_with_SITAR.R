## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  if (!require(sitar)) install.packages('sitar')

## ---- results='hide'-----------------------------------------------------
library(sitar)
ff <- na.omit(berkeley[berkeley$sex == 2 & berkeley$age >= 8 & berkeley$age <= 18, 
                       c('id', 'age', 'height')])
fh1 <- sitar(x = age, y = height, id = id, data = ff, df = 5)

## ---- fig.show='hold'----------------------------------------------------
par(mar = c(4,4,1,1) + 0.1, cex = 0.8)
mplot(x = age, y = height, id = id, data = ff, col = id, las = 1)
plot(fh1, opt = 'a', col = id, las = 1, xlim = xaxsd(), ylim = yaxsd())

## ---- results='hide', fig.show='hold'------------------------------------
par(mar = c(4,4,1,1) + 0.1, cex = 0.8)
plot(fh1, opt = 'd', las = 1, apv = TRUE)
plot(fh1, opt = 'v', las = 1, apv = TRUE, lty = 2)

## ---- fig.show='hold'----------------------------------------------------
par(mar = c(4,4,1,1) + 0.1, cex = 0.8)
plot(fh1, opt = 'u', las = 1, col = 8, lwd = 0.5)
lines(fh1, opt = 'd', lty = 2)
lines(fh1, opt = 'ua', col = id, subset = id == 310 | id == 355)
legend('bottomright', c('id 310', 'mean', 'id 355'), lty = c(1, 2, 1), col = c(4, 1, 2), cex = 0.8, inset=0.04)
pairs(ranef(fh1), labels = c('size', 'timing', 'intensity'), pch=20)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(cor(ranef(fh1)), digits = 2)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(ranef(fh1)[1:10, ], digits = 2)

