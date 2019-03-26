## ----fig.width=6, fig.height=4, fig.align='center'-----------------------
library(OutliersO3)
data(Election2005, package="mbgraphic")
data <- Election2005[, c(6, 10, 17, 28)]
O3d <- O3prep(data, method=c("HDo", "PCS", "BAC", "adjOut", "DDC", "MCD"), tolHDo=0.05, tolPCS=0.5, tolBAC=0.95, toladj=0.25, tolDDC=0.01, tolMCD=0.5)
O3d1 <- O3plotM(O3d)
O3d1$nOut
O3p <- O3prep(data, method=c("HDo", "PCS", "BAC", "adjOut", "DDC", "MCD"))
O3p1 <- O3plotM(O3p)
O3p1$nOut
O3p1$gO3

## ------------------------------------------------------------------------
data(etymology, package="languageR")
data <- etymology[, c(2, 4, 5, 10, 13, 14)]
O3q <- O3prep(data, method=c("HDo", "PCS", "BAC", "adjOut", "DDC", "MCD"), tolHDo=0.01, tolPCS=0.005, tolBAC=0.005, toladj=0.1, tolDDC=0.01, tolMCD=0.000001)
O3q1 <- O3plotM(O3q)
O3q1$nOut

## ----include=FALSE-------------------------------------------------------
library(dplyr)

## ------------------------------------------------------------------------
outHD <- O3q1$outsTable %>% filter(Method=="HDo") %>% group_by(Combination) %>% summarise(num=n()) %>% filter(num>5)
knitr::kable(outHD, row.names=FALSE)

## ----fig.width=7, fig.height=8, fig.align='center'-----------------------
O3r <- O3prep(data, method=c("HDo", "PCS", "BAC", "adjOut", "DDC", "MCD"), k1=2, tolHDo=0.01, tolPCS=0.0025, tolBAC=0.005, toladj=0.1, tolDDC=0.005, tolMCD=0.000001)
O3r1 <- O3plotM(O3r, caseNames=etymology$Verb)
O3r1$nOut
library(gridExtra)
grid.arrange(O3r1$gO3, O3r1$gpcp, ncol=1, heights=c(2,1))

