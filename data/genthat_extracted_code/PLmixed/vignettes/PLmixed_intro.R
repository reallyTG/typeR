## ----cran-installation, eval = FALSE-------------------------------------
#  install.packages("PLmixed")

## ----load-data-----------------------------------------------------------
library("PLmixed")
head(KYPSsim)

## ----time-points---------------------------------------------------------
unique(KYPSsim$time)

## ----create-lambda-------------------------------------------------------
kyps.lam <- rbind(c( 1,  0),
                  c(NA,  0),
                  c(NA,  1),
                  c(NA, NA))


## ----fit-kyps-model, results = "hide"------------------------------------
 kyps.model <- PLmixed(esteem ~ as.factor(time) +  (0 + hs | hid)   
                       + (0 + ms | mid) + (1 | sid), data = KYPSsim,  
                       factor = list(c("ms", "hs")), load.var = "time",
                       lambda = list(kyps.lam))

## ----kyps-summary--------------------------------------------------------
summary(kyps.model)

## ------------------------------------------------------------------------
library("PLmixed")
head(IRTsim)

## ------------------------------------------------------------------------
IRTsim <- IRTsim[order(IRTsim$item), ] # Order by item
unique(IRTsim$item)

## ------------------------------------------------------------------------
irt.lam = c(1, NA, NA, NA, NA) # Specify the lambda matrix

## ---- results = "hide"---------------------------------------------------
irt.model <- PLmixed(y ~ 0 + as.factor(item) + (0 + ability | sid) + (0 + ability | school),
                     data = IRTsim, load.var = c("item"), family = binomial,
                     factor = list(c("ability")), lambda = list(irt.lam))

## ------------------------------------------------------------------------
summary(irt.model)

## ------------------------------------------------------------------------
betas <- irt.model$'Fixed Effects'[, 1]
lambdas <- irt.model$Lambda$lambda.item[, 1]
(beta.difficulty <- -betas/lambdas)

## ---- message = FALSE----------------------------------------------------
library("irtoys")

## ---- fig.width = 5, fig.height = 5--------------------------------------
item.params <- cbind(lambdas, beta.difficulty, rep(0, 5))
plot(irf(item.params), co = NA, label = TRUE)

