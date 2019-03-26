## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=4, fig.path='Figs/', fig.show='hold',
                      warning=FALSE, message=FALSE)

## ----load_libraries, message=FALSE, warning=FALSE------------------------
require(smooth)
require(Mcomp)

## ----gum_N2457-----------------------------------------------------------
gum(M3$N2457$x, h=18, holdout=TRUE)

## ----gum_N2457_2[1]_1[12]------------------------------------------------
gum(M3$N2457$x, h=18, holdout=TRUE, orders=c(2,1), lags=c(1,12))

## ----Autogum_N2457_1[1]--------------------------------------------------
auto.gum(M3$N2457$x, h=18, holdout=TRUE, intervals=TRUE, silent=FALSE)

## ----gum_N2457_predefined------------------------------------------------
	transition <- matrix(c(1,0,0,1,1,0,0,0,1),3,3)
	measurement <- c(1,1,1)
	gum(M3$N2457$x, h=18, holdout=TRUE, orders=c(2,1), lags=c(1,12), transition=transition, measurement=measurement)

