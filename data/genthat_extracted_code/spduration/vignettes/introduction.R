## ----data, warning=FALSE-------------------------------------------------
library("spduration")
data(bscoup)
?bscoup
head(bscoup[, 1:5])

## ------------------------------------------------------------------------
str(bscoup)

## ------------------------------------------------------------------------
bscoup$coup <- ifelse(bscoup$coup == "yes", 1, 0)
table(bscoup$coup)

## ------------------------------------------------------------------------
bscoup      <- add_duration(bscoup, "coup", unitID = "countryid", tID = "year",
                            freq = "year", ongoing = FALSE)

## ----models, include = TRUE----------------------------------------------
weib_model <- spdur(
  duration ~ milreg + instab + regconf,
  atrisk ~ couprisk + wealth + milreg + rwar + regconf + samerica + camerica,
  data = bscoup, distr = "weib", silent = TRUE)

loglog_model <- spdur(
  duration ~ milreg + instab + regconf,
  atrisk ~ couprisk + wealth + milreg + rwar + regconf + samerica + camerica,
  data = bscoup, distr = "loglog", silent = TRUE)

## ----summary-table, include = TRUE, results='asis'-----------------------
library("xtable")
tbl <- xtable(loglog_model, caption = "Coup model with log-logistic hazard",
              label = "loglog_table")
print(tbl, type = "html", caption.placement = "top", comment = FALSE, include.rownames = FALSE)

## ----fit-stats-----------------------------------------------------------
matrix(c(
  AIC(weib_model), AIC(loglog_model), BIC(weib_model), BIC(loglog_model)
  ), ncol = 2, dimnames = list(c("Weibull", "Loglog"), c("AIC", "BIC")))

## ----hazard-ex-1, fig.show='hold'----------------------------------------
plot(weib_model,   type="hazard", main="Weibull")
plot(loglog_model, type="hazard", main="Loglog")

## ----hazard-ex-2---------------------------------------------------------
plot_hazard(loglog_model,
     xvals = c(1, 1, 10, 0.05),
     zvals = c(1, 7, 8.64, 1, 1, 0.05, 0, 0),
     main = "High risk scenario")

## ---- fig.show = 'hold', , fig.width = 5, fig.height = 5-----------------
par(mfrow=c(2,1), mar=c(2,2,2,2))
plot(weib_model, heading = "Weibull")
plot(loglog_model, heading = "LogLog")

## ------------------------------------------------------------------------
data(bscoup)
bscoup$coup <- ifelse(bscoup$coup == "yes", 1, 0)
coup_train <- bscoup[bscoup$year < 1996, ]
coup_train <- add_duration(coup_train, "coup", unitID = "countryid", tID = "year",
                          freq = "year", ongoing = FALSE)

## ------------------------------------------------------------------------
coup_test  <- add_duration(bscoup, "coup", unitID = "countryid", tID = "year",
                           freq = "year", ongoing = FALSE)
coup_test  <- coup_test[coup_test$year >= 1996, ]

## ----estimate train models-----------------------------------------------
weib_model2   <- spdur(
  duration ~ milreg + instab + regconf,
  atrisk ~ couprisk + wealth + milreg + rwar + regconf + samerica + camerica,
  data = coup_train, silent = TRUE)

loglog_model2 <- spdur(
  duration ~ milreg + instab + regconf,
  atrisk ~ couprisk + wealth + milreg + rwar + regconf + samerica + camerica,
  data = coup_train, distr = "loglog", silent = TRUE)

## ------------------------------------------------------------------------
weib2_test_p   <- predict(weib_model2, newdata = coup_test, na.action = na.omit)
loglog2_test_p <- predict(loglog_model2, newdata = coup_test, na.action = na.omit)

## ----oos-sepplots, fig.show = "hold", fig.width = 5, fig.height = 5------
library("separationplot")
obs_y <- coup_test[complete.cases(coup_test), "coup"]

par(mfrow=c(2,1),mar=c(2,2,2,2))
separationplot(weib2_test_p,   obs_y, newplot = FALSE)
separationplot(loglog2_test_p, obs_y, newplot = FALSE)

