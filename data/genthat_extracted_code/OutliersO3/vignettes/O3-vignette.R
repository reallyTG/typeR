## ----fig.width=7, fig.height=8, fig.align='center'-----------------------
library(OutliersO3)
data(Election2005, package="mbgraphic")
data <- Election2005[, c(6, 10, 17, 28)]
O3s <- O3prep(data, method="HDo", tols=0.05, boxplotLimits=6)
O3s1 <- O3plotT(O3s, caseNames=Election2005$Name)
O3s1$gO3

## ----fig.width=7, fig.height=8, fig.align='center'-----------------------
O3x <- O3prep(data, method="HDo", tols=c(0.1, 0.05, 0.01), boxplotLimits=c(3, 6, 10))
O3x1 <- O3plotT(O3x)
library(gridExtra)
grid.arrange(O3x1$gO3, O3x1$gpcp, ncol=1)

## ----fig.width=7, fig.height=8, fig.align='center'-----------------------
O3m <- O3prep(data, method=c("HDo", "PCS"))
O3m1 <- O3plotM(O3m)
grid.arrange(O3m1$gO3, O3m1$gpcp, ncol=1)

## ----message=FALSE-------------------------------------------------------
O3y <- O3prep(data, method=c("HDo", "PCS", "BAC", "adjOut", "DDC", "MCD"), tols=0.05, boxplotLimits=6)
O3y1 <- O3plotM(O3y)
cx <- data.frame(outlier_method=names(O3y1$nOut), number_of_outliers=O3y1$nOut)
knitr::kable(cx, row.names=FALSE)

## ----fig.width=7, fig.height=8, fig.align='center'-----------------------
grid.arrange(O3y1$gO3, O3y1$gpcp, ncol=1)

