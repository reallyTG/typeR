## ---- echo=FALSE---------------------------------------------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height=5, comment=NA)
options(width = 105)

## ------------------------------------------------------------------------------------------------------
suppressPackageStartupMessages(library(PWFSLSmoke))

N_M <- monitor_subset(Northwest_Megafires, tlim=c(20150801,20150831),
                      timezone="America/Los_Angeles")
Omak <- monitor_subset(N_M, monitorIDs='530470013_01')
Omak_nowcast <- monitor_nowcast(Omak)

## ----echo=FALSE----------------------------------------------------------------------------------------
monitorPlot_timeseries(Omak, type='l', lwd=2)
monitorPlot_timeseries(Omak_nowcast, add=TRUE, type='l', col='purple', lwd=2)
addAQILines()
addAQILegend(lwd=1, pch=NULL, 'topleft')
legend("topright", lwd=2, col=c('black','purple'), legend=c('hourly','nowcast'))
title("Hourly and Nowcast PM2.5 Values\nOmak, Washington; August, 2015")

## ------------------------------------------------------------------------------------------------------
Omak_2015_08_21 <- monitor_subset(Omak, tlim=c(2015082100, 2015082111))
(example1_df <- Omak_2015_08_21$data)

## ------------------------------------------------------------------------------------------------------
(example1_values <- rev(example1_df$`530470013_01`))

## ------------------------------------------------------------------------------------------------------
(w_star <- min(example1_values)/max(example1_values))

## ------------------------------------------------------------------------------------------------------
(w <- max(1/2, w_star))

## ------------------------------------------------------------------------------------------------------
(numer <- sum(w^(0:11)*example1_values))

## ------------------------------------------------------------------------------------------------------
(denom <- sum(w^(0:11)))

## ----echo=FALSE----------------------------------------------------------------------------------------
numer/denom

## ------------------------------------------------------------------------------------------------------
monitor_subset(Omak_nowcast, tlim=rep(2015082111, 2))$data

## ------------------------------------------------------------------------------------------------------
Omak_2015_08_24 <- monitor_subset(Omak, tlim=c(2015082412, 2015082423))
(example2_df <- Omak_2015_08_24$data)

## ------------------------------------------------------------------------------------------------------
(example2_values <- rev(example2_df$`530470013_01`))

## ------------------------------------------------------------------------------------------------------
w_star <- min(example2_values, na.rm=TRUE)/max(example2_values, na.rm=TRUE)
(w <- max(1/2, w_star))

## ------------------------------------------------------------------------------------------------------
validIndexes <- which(!is.na(example2_values))
numer <- sum(w^(validIndexes-1)*example2_values[validIndexes])
denom <- sum(w^(validIndexes-1))
numer/denom

## ------------------------------------------------------------------------------------------------------
monitor_subset(Omak_nowcast, tlim=rep(2015082423, 2))$data

## ------------------------------------------------------------------------------------------------------
example2_df$nowcast <- monitor_subset(Omak_nowcast, tlim=c(2015082412, 2015082423))$data$`530470013_01`
colnames(example2_df) <- c("datetime", "monitored", "nowcast")
example2_df

## ------------------------------------------------------------------------------------------------------
Omak_2015_08_23 <- monitor_subset(Omak, tlim=c(2015082312, 2015082323))
(example3_df <- Omak_2015_08_23$data)

## ------------------------------------------------------------------------------------------------------
(example3_values <- rev(example3_df$`530470013_01`))

## ------------------------------------------------------------------------------------------------------
w_star <- min(example3_values, na.rm=TRUE)/max(example3_values, na.rm=TRUE)
(w <- max(1/2, w_star))

## ------------------------------------------------------------------------------------------------------
validIndexes <- which(!is.na(example3_values))
numer <- sum(w^(validIndexes-1)*example3_values[validIndexes])
denom <- sum(w^(validIndexes-1))
numer/denom

## ------------------------------------------------------------------------------------------------------
monitor_subset(Omak_nowcast, tlim=rep(2015082323, 2))$data

## ------------------------------------------------------------------------------------------------------
example3_df$nowcast <- monitor_subset(Omak_nowcast, tlim=c(2015082312, 2015082323))$data$`530470013_01`
colnames(example3_df) <- c("datetime", "monitored", "nowcast")
example3_df

## ------------------------------------------------------------------------------------------------------
tlim <- c(2015082500,2015082523)
Omak2 <- monitor_subset(Northwest_Megafires, tlim=tlim, monitorIDs = '530470013_01')
Omak2_nowcast <- monitor_nowcast(Omak2)
Omak2_nowcast$data

## ------------------------------------------------------------------------------------------------------
Omak2_nowcast <- monitor_nowcast(Omak2, includeShortTerm = TRUE)
Omak2_nowcast$data

## ------------------------------------------------------------------------------------------------------
example4_df <- monitor_subset(Omak_nowcast, tlim=tlim)$data
example4_df$shortTerm_T <- Omak2_nowcast$data$`530470013_01`
colnames(example4_df) <- c("datetime", "fullDataset", "shortTerm")
example4_df

## ------------------------------------------------------------------------------------------------------
aqi <- monitor_aqi(Omak)
example5_df <- data.frame("datetime"=Omak$data$datetime,
                          "monitored"=Omak$data$`530470013_01`,
                          "aqi"=aqi$data$`530470013_01`)
example5_df <- example5_df[500:650,]
plot(example5_df$datetime, example5_df$monitored, xlab='Date', ylab='')
lines(example5_df$datetime, example5_df$aqi, col="blue")

