## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)
library(RcmdrPlugin.UCA)
sigma.test <- TeachingDemos::sigma.test

## ---- include = TRUE-----------------------------------------------------
data(sweetpotato, package = "randtests")
sweetpotato <- as.data.frame (sweetpotato)

## ---- include = TRUE, results = 'hide'-----------------------------------
with(sweetpotato, sigma.test(yield[!is.na(yield)], alternative='two.sided', sigmasq=1.0, conf.level=0.95))

## ---- include = TRUE-----------------------------------------------------
with(sweetpotato, sigma.test(yield[!is.na(yield)], alternative='two.sided', sigmasq=1.0, conf.level=0.95))

## ---- include = TRUE-----------------------------------------------------
data(AMSsurvey, package = "carData")

## ---- include = TRUE, results = 'hide'-----------------------------------
with (AMSsurvey, twolevelfactor.runs.test (sex))

## ---- include = TRUE-----------------------------------------------------
with (AMSsurvey, twolevelfactor.runs.test (sex))

## ---- include = TRUE, results = 'hide'-----------------------------------
with (sweetpotato, numeric.runs.test (yield))

## ---- include = TRUE-----------------------------------------------------
with (sweetpotato, numeric.runs.test (yield))

## ---- include = TRUE-----------------------------------------------------
data(Chile, package="carData")

## ----include = TRUE, results = 'hide'------------------------------------
RegModel.1 <- lm(income~age, data=Chile)
summary(RegModel.1)

## ----include = TRUE------------------------------------------------------
RegModel.1 <- lm(income~age, data=Chile)
summary(RegModel.1)

## ----include=TRUE, echo = FALSE, results='hide'--------------------------
edit <- function(x)
{
.data <- Chile[0,]
.data[1:2,] <- NA
.data$age <- c(34, 45)
.data
}

## ----include = TRUE, results = 'hide'------------------------------------
.data <- edit(Chile[0,])
.data
predict(RegModel.1, .data)
remove(.data)

## ----include = TRUE------------------------------------------------------
.data <- edit(Chile[0,])
.data
predict(RegModel.1, .data)
remove(.data)

## ----include = TRUE, results = 'hide'------------------------------------
RegModel.1 <- lm(income~age, data=Chile)
summary(RegModel.1)

## ----include = TRUE------------------------------------------------------
RegModel.1 <- lm(income~age, data=Chile)
summary(RegModel.1)

## ----include = TRUE, results = 'hide'------------------------------------
Chile$fitted.RegModel.1 <- predict(RegModel.1, Chile)

## ----include = TRUE------------------------------------------------------
Chile$fitted.RegModel.1 <- predict(RegModel.1, Chile)

