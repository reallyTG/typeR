## ----fig.align='center',fig.height=5, fig.width=7,message=FALSE,warning=FALSE----
library(PANICr)
library(xts)
data("NIPA_agg_9")
NIPA_agg_9_zoo <- as.zoo(NIPA_agg_9)

tsRainbow <- rainbow(ncol(NIPA_agg_9))
plot(x = NIPA_agg_9_zoo,ylab = " Inflation Rate", xlab = "Years",
     main = "Year on Year Inflation Rates for NIPA",  xy.labels = FALSE, plot.type = "single",
     col = tsRainbow)

## ---- results='asis'-----------------------------------------------------
agg1_04 <- panic04(NIPA_agg_9, nfac = 100,k1 = 7,criteria = "BIC3")

## ----echo=FALSE,results='asis'-------------------------------------------
output_1 <- summary(agg1_04)
knitr::kable(output_1$common_tests)

## ----echo=FALSE,results='asis'-------------------------------------------
knitr::kable(output_1$pooled_tests)

## ------------------------------------------------------------------------
agg1_10_d <- panic10(NIPA_agg_9,nfac = 100, k1 = 7,criteria = "BIC3",demean = TRUE)

## ----echo=FALSE,results='asis'-------------------------------------------
output_10_d <- summary(agg1_10_d)
knitr::kable(output_10_d$pool_test)

## ----echo=FALSE,results='asis'-------------------------------------------
knitr::kable(output_10_d$mp_test_c)

## ----echo=FALSE,results='asis'-------------------------------------------
knitr::kable(output_10_d$pmsb_test)

## ------------------------------------------------------------------------
agg1_10_nd <- panic10(NIPA_agg_9,nfac = 100, k1 = 7,criteria = "BIC3",demean = FALSE)

## ----echo=FALSE,results='asis'-------------------------------------------
output_10_nd <- summary(agg1_10_nd)
knitr::kable(output_10_nd$mp_test_a)

## ----echo=FALSE,results='asis'-------------------------------------------
knitr::kable(output_10_nd$mp_test_b)

## ----echo=FALSE,results='asis'-------------------------------------------
knitr::kable(output_10_nd$pmsb_test)

