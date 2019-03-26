## ---- echo=FALSE, message=FALSE------------------------------------------
library(CytobankAPI)
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ------------------------------------------------------------------------
# Authenticate via authentication token
cyto_session <- authenticate(site="premium", auth_token="secret_auth_token")

## ------------------------------------------------------------------------
cyto_session

## ---- echo=FALSE, message=FALSE------------------------------------------
c1 <- c(1, 0.007, 0, 0.0023, 0, 0.0026)

new_experiment_dataframe <- data.frame(id=c(1),
                                       version=c(42),
                                       purpose=c("CytobankAPI quickstart vignette"),
                                       comments=c(""),
                                       public=c(FALSE),
                                       deleted=c(FALSE),
                                       sources=c(""),
                                       experimentName=c("My New Experiment"),
                                       ...=c("..."),
                                       stringsAsFactors=FALSE)

knitr::kable(new_experiment_dataframe)

## ---- echo=FALSE, message=FALSE------------------------------------------
c1 <- c(1, 0.007, 0, 0.0023, 0, 0.0026)
c2 <- c(0.2986, 1, 0, 0.0703, 0, 0.002)
c3 <- c(0.0165, 0.0726, 1, 0.015, 0.0039, 0)
c4 <- c(0, 0.0055, 0.134, 1, 0, 0)
c5 <- c(0, 0, 0.0495, 0, 1, 0)
c6 <- c(0, 0.0017, 0.012, 0.0034, 0, 1)

compensation_matrix_dataframe <- data.frame(c1, c2, c3, c4, c5, c6, row.names=c("channel1", "channel2", "channel3", "channel4", "channel5", "channel6"))
colnames(compensation_matrix_dataframe) <- c("channel1", "channel2", "channel3", "channel4", "channel5", "channel6")

knitr::kable(compensation_matrix_dataframe)

## ---- echo=FALSE, message=FALSE------------------------------------------
statistics_dataframe_proliferate_by_row <- data.frame(matrix(vector(), 0, 4, dimnames=list(c(), c("File/Population information", "Channel 1 statistics", "Channel 2 statistics", "Channel 3 statistics"))), check.names=FALSE)

new_row <- c("File 1/ Population 1 info", "F1/P1/Ch1 statistics", "F1/P1/Ch2 statistics", "F1/P1/Ch3 statistics")
statistics_dataframe_proliferate_by_row[nrow(statistics_dataframe_proliferate_by_row)+1,] <- new_row
new_row <- c("File 1/ Population 2 info", "F1/P2/Ch1 statistics", "F1/P2/Ch2 statistics", "F1/P2/Ch3 statistics")
statistics_dataframe_proliferate_by_row[nrow(statistics_dataframe_proliferate_by_row)+1,] <- new_row
new_row <- c("File 2/ Population 1 info", "F2/P1/Ch1 statistics", "F2/P1/Ch2 statistics", "F2/P1/Ch3 statistics")
statistics_dataframe_proliferate_by_row[nrow(statistics_dataframe_proliferate_by_row)+1,] <- new_row
new_row <- c("File 2/ Population 2 info", "F2/P2/Ch1 statistics", "F2/P2/Ch2 statistics", "F2/P2/Ch3 statistics")
statistics_dataframe_proliferate_by_row[nrow(statistics_dataframe_proliferate_by_row)+1,] <- new_row

# statistics_dataframe_proliferate_by_row <- data.frame(matrix(vector(), 0, 30, dimnames=list(c(), c("experimentId", "gateVersion", "compensationId", "fcsFileId", "fcsFileName", "gateSetId", "gateSetName", "eventCounts", "channelShortNameId", "shortChannelName", "longChannelName", "minimums", "maximums", "means", "medians", "variances", "standardDeviations", "secondPercentiles", "ninetyEighthPercentiles", "channelShortNameId", "shortChannelName", "longChannelName", "minimums", "maximums", "means", "medians", "variances", "standardDeviations", "secondPercentiles", "ninetyEighthPercentiles"))))
# 
# new_row <- c(1208, 1, -2, 41514, "il10.fcs", 6, "CD3+CD4- T cells", 3383, 15, "PacBlu-A", "CD4", -143.701830921412, 386.655349398012, 97.602683405189, 94.5949940144421, 6484.29057677642, 80.5250928392909, -60.9314555262346, 273.152308001343, 8, "PE-A", "CD33", -296.74658042302, 505.623054043652, 63.9457311236668, 61.3383712370893, 11847.6907259889, 108.847097921758, -151.388970866581, 306.168386826939)
# statistics_dataframe_proliferate_by_row[nrow(statistics_dataframe_proliferate_by_row)+1,] <- new_row

knitr::kable(statistics_dataframe_proliferate_by_row)

## ---- echo=FALSE, message=FALSE------------------------------------------
statistics_dataframe_proliferate_by_col <- data.frame(matrix(vector(), 0, 2, dimnames=list(c(), c("File/Population information", "Channel statistics"))), check.names=FALSE)
new_row <- c("File 1/ Population 1 info", "Ch1 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 1/ Population 1 info", "Ch2 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 1/ Population 1 info", "Ch3 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row

new_row <- c("File 1/ Population 2 info", "Ch1 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 1/ Population 2 info", "Ch2 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 1/ Population 2 info", "Ch3 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row

new_row <- c("File 2/ Population 1 info", "Ch1 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 2/ Population 1 info", "Ch2 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 2/ Population 1 info", "Ch3 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row

new_row <- c("File 2/ Population 2 info", "Ch1 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 2/ Population 2 info", "Ch2 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row
new_row <- c("File 2/ Population 2 info", "Ch3 statistics")
statistics_dataframe_proliferate_by_col[nrow(statistics_dataframe_proliferate_by_col)+1,] <- new_row

knitr::kable(statistics_dataframe_proliferate_by_col)

## ---- echo=FALSE, message=FALSE------------------------------------------
file_population_information <- data.frame(matrix(vector(), 0, 8, dimnames=list(c(), c("expId", "gateVersion", "compId", "fcsFileId", "fcsFileName", "gateSetId", "gateSetName", "eventCounts"))), check.names=FALSE)

new_row <- c("22", "1", "-2", "8", "il10.fcs", "5", "CD20+ B cells", "10000")
file_population_information[nrow(file_population_information)+1,] <- new_row
new_row <- c("22", "1", "-2", "9", "il6.fcs", "5", "CD20+ B cells", "20000")
file_population_information[nrow(file_population_information)+1,] <- new_row
new_row <- c("22", "1", "-2", "10", "lps.fcs", "5", "CD20+ B cells", "30000")
file_population_information[nrow(file_population_information)+1,] <- new_row

knitr::kable(file_population_information, align="c")

## ---- echo=FALSE, message=FALSE------------------------------------------
channel_statistics <- data.frame(matrix(vector(), 0, 11, dimnames=list(c(), c("chId", "short", "long", "mins", "maxs", "means", "medians", "variances", "stdDev", "2nd", "98th"))), check.names=FALSE)

new_row <- c("7", "PacBlu-A", "CD4", "-143.70", "386.65", "97.60", "94.59", "6484.29", "80.52", "-60.93", "273.15")
channel_statistics[nrow(channel_statistics)+1,] <- new_row

knitr::kable(channel_statistics, align="c")

