## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=FALSE, results='asis'-----------------------------------------
library(modi)
knitr::kable(head(sepe[ ,c("idnr","weight","totinvwp","totinvwm","totinvap","totinvto","totexpwp","totexpwm","totexpap","totexpto")], 10))

## ---- eval = TRUE--------------------------------------------------------
# attach data
data("sepe")

# recode 0s as NA
sepenozero <- sepe
sepenozero[sepenozero == 0] <- NA

## ---- eval = TRUE--------------------------------------------------------
# relevant variables
sepevar8 <- c("totinvwp","totinvwm","totinvap","totinvto",
              "totexpwp","totexpwm","totexpap","totexpto")

# log(x + 1) transformation
sepe_transformed <- log(sepenozero[ ,sepevar8] + 1)

# show the first 5 observations
head(sepe_transformed)

## ---- eval = TRUE--------------------------------------------------------
# run the BEM() algorithm
res.bem <- BEM(sepe_transformed, sepe$weight, c0 = 5)

## ---- eval = TRUE--------------------------------------------------------
# run the BEM() algorithm with different alpha
res.bem <- BEM(sepe_transformed, sepe$weight, c0 = 5, alpha = 0.01 / nrow(sepe_transformed))

## ---- eval = TRUE, fig.width = 7, fig.height = 5, results = "hide"-------
# QQ-plot of MD vs. F-distribution
PlotMD(res.bem$dist, ncol(sepe_transformed), alpha = 0.95)

## ---- eval = TRUE--------------------------------------------------------
# find the cutpoint chosen by BEM()
min(res.bem$dist[res.bem$outind])

## ---- eval = TRUE--------------------------------------------------------
# find outliers with cutpoint 70
outind <- ifelse(res.bem$dist > 70, TRUE, FALSE)

# set NAs to FALSE
outind[is.na(outind)] <- FALSE

# how many outliers are there?
sum(outind)

## ---- eval = TRUE--------------------------------------------------------
# find cutpoint with fixed number of outliers
quantile(res.bem$dist, 0.95, na.rm = TRUE)

## ---- eval = TRUE, fig.width = 7, fig.height = 5, results = "hide"-------
# create transformed data including zeros
df <- log(sepe[, sepevar8] + 1)

# set up scatterplot totexpto vs. totinvto
plot(df$totinvto, df$totexpto, type = "n", xlab = "Total Inv.", ylab = "Total Exp.")

# plot comparison of outliers determined with visual cutpoint and default cutpoint
points(df$totinvto[!res.bem$outind], df$totexpto[!res.bem$outind])
points(df$totinvto[res.bem$outind], df$totexpto[res.bem$outind], pch = 4, col = "red")
points(df$totinvto[outind], df$totexpto[outind], pch = 0, col = "blue")

## ---- eval = TRUE--------------------------------------------------------
# apply Winsimp()
res.winsimp <- Winsimp(sepe_transformed, 
                       res.bem$output$center, 
                       res.bem$output$scatter, 
                       outind)

## ---- eval = TRUE--------------------------------------------------------
# get the imputed data
imp_data <- res.winsimp$imputed.data

# indicate the zeros in original dataset
zeros <- ifelse(sepe[ ,sepevar8] == 0, 1, 0)

# redefine NAs as 0
zeros[is.na(zeros)] <- 0

# re-insert zeros
imp_data <- as.data.frame(ifelse(zeros == 1, 0, imp_data))

## ---- eval = TRUE, fig.width = 7, fig.height = 5, results = "hide"-------
# create transformed data including zeros
df <- log(sepe[, sepevar8] + 1)

# set up scatterplot totexpto vs. totinvto
plot(df$totinvto, df$totexpto, type = "n", xlab = "Total Inv.", ylab = "Total Exp.")

# plot comparison of outliers determined with visual cutpoint and default cutpoint
points(df$totinvto[outind], df$totexpto[outind], pch = 0, col = "blue")
points(imp_data$totinvto[outind], imp_data$totexpto[outind], pch = 0, col = "green")

## ---- eval = TRUE--------------------------------------------------------
# log(x + 1) transformation
sepe_transformed <- log(sepenozero[ ,sepevar8] + 1)

## ---- eval = TRUE--------------------------------------------------------
# run the TRC() algorithm
res.trc <- TRC(sepe_transformed, sepe$weight)

## ---- eval = TRUE--------------------------------------------------------
# run the TRC() algorithm
res.trc <- TRC(sepe_transformed, sepe$weight, gamma = 30 / res.trc$output$sample.size)

## ---- eval = TRUE--------------------------------------------------------
# find the cutpoint chosen by TRC()
min(res.trc$dist[res.trc$outind])

## ---- eval = TRUE, fig.width = 7, fig.height = 5, results = "hide"-------
# QQ-plot of MD vs. F-distribution
PlotMD(res.trc$dist, ncol(sepe_transformed))

## ---- eval = TRUE--------------------------------------------------------
# find outliers with cutpoint 70
outind <- ifelse(res.trc$dist > 210, TRUE, FALSE)

# set NAs to FALSE
outind[is.na(outind)] <- FALSE

# how many outliers are there?
sum(outind)

## ---- eval = TRUE--------------------------------------------------------
# run the GIMCD() algorithm
res.gimcd <- GIMCD(sepe_transformed, seedem = 234567819, seedmcd = 4097)

## ---- eval = TRUE--------------------------------------------------------
# find the cutpoint chosen by GIMCD()
min(res.gimcd$dist[res.gimcd$outind])

## ---- eval = TRUE, fig.width = 7, fig.height = 5, results = "hide"-------
# QQ-plot of MD vs. F-distribution
PlotMD(res.gimcd$dist, ncol(sepe_transformed))

## ---- eval = TRUE--------------------------------------------------------
# find outliers with cutpoint 70
outind <- ifelse(res.gimcd$dist > 24, TRUE, FALSE)

# set NAs to FALSE
outind[is.na(outind)] <- FALSE

# how many outliers are there?
sum(outind)

## ---- eval = TRUE, fig.width = 7, fig.height = 5-------------------------
# create transformed data including zeros
df <- log(sepe[, sepevar8] + 1)

# run the EAdet() algorithm
res.eadet <- EAdet(df, sepe$weight)

## ---- eval = TRUE--------------------------------------------------------
# how many outliers?
sum(res.eadet$outind, na.rm = TRUE)

## ---- eval = TRUE--------------------------------------------------------
# determine outliers based on new cutpoint
outind <- res.eadet$infection.time >= 5

# how many outliers are there?
sum(outind, na.rm = TRUE)

## ---- eval = TRUE--------------------------------------------------------
# determine outliers based on new cutpoint
res.eaimp <- EAimp(df, sepe$weight, outind = res.eadet$outind, 
                   duration = res.eadet$output$duration)

