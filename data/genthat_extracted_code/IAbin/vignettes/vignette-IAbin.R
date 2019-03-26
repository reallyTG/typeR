## ------------------------------------------------------------------------
p0 = 0.6
M = 100
q = 0.5
alpha1 = 0.01
cp1 = 0.2

## ------------------------------------------------------------------------
xlab = "N: Number of patients at interim analysis"
ylab = "T: Number of responders at interim analysis"
col = "blue"
main = "N-T plot"
lty = 1

## ---- echo=FALSE---------------------------------------------------------
library(IAbin)

## ---- fig.width = 4, fig.height = 4--------------------------------------
NT_s = plotNT.sup(p0, M, q, alpha1)
print(head(NT_s))

## ---- fig.width = 4, fig.height = 4--------------------------------------
NT_f = plotNT.fut(p0, M, q, alpha1, cp1)

## ---- fig.width = 4, fig.height = 4--------------------------------------
NT_s3 = plotNT.sup(p0 = c(0.2, 0.4, 0.6), M, q, alpha1, col = c("green", "red", "blue"))
par(new = T)
NT_f3 = plotNT.fut(p0 = c(0.2, 0.4, 0.6), M, q, alpha1, cp1, col = c("green", "red", "blue"))

