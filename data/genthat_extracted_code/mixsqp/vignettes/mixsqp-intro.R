## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,results = "hold",comment = "#",
                      fig.align="center")
if (!requireNamespace("REBayes",quietly = TRUE))
  knitr::opts_chunk$set(eval = FALSE)

## ----load-pkgs, eval=TRUE, message=FALSE---------------------------------
library(mixsqp)

## ----load-rmosek, message=FALSE------------------------------------------
library(Rmosek)

## ----set-seed, eval=TRUE-------------------------------------------------
set.seed(1)

## ----sim-data-small, eval=TRUE-------------------------------------------
L <- simulatemixdata(1000,20)$L
dim(L)

## ----fit-model-mixsqp-small, eval=TRUE-----------------------------------
fit.sqp <- mixsqp(L)

## ----plot-sqp-progress, eval=TRUE, fig.height=5, fig.width=7-------------
numiter <- nrow(fit.sqp$progress)
plot(1:numiter,fit.sqp$progress$objective,type = "b",
     pch = 20,lwd = 2,xlab = "SQP iteration",
     ylab = "objective",xaxp = c(1,numiter,numiter - 1))

## ----fit-model-kwdual-small----------------------------------------------
fit.ip <- mixkwdual(L)

## ----compare-solutions-smaller-------------------------------------------
cat(sprintf("Objective at SQP solution: %0.16f\n",fit.sqp$value,digits = 16))
cat(sprintf("Objective at IP solution:  %0.16f\n",fit.ip$value,digits = 16))
cat(sprintf("Difference in objectives:  %0.4e\n",fit.sqp$value - fit.ip$value))

## ----sim-data-large, eval=TRUE-------------------------------------------
L <- simulatemixdata(1e5,100)$L
dim(L)

## ----fit-model-sqp-large, eval=TRUE--------------------------------------
timing <- system.time(fit.sqp <- mixsqp(L))
cat(sprintf("Computation took %0.2f seconds\n",timing["elapsed"]))

## ----fit-model-ip-large--------------------------------------------------
timing <- system.time(fit.ip  <- mixkwdual(L))
cat(sprintf("Computation took %0.2f seconds\n",timing["elapsed"]))

## ----compare-solutions-large---------------------------------------------
cat(sprintf("Objective at SQP solution: %0.16f\n",fit.sqp$value,digits = 16))
cat(sprintf("Objective at IP solution:  %0.16f\n",fit.ip$value,digits = 16))
cat(sprintf("Difference in objectives:  %0.4e\n",fit.sqp$value - fit.ip$value))

## ----session-info, eval=TRUE---------------------------------------------
sessionInfo()

## ----mosek-info----------------------------------------------------------
mosek_version()

