## ----packages, include=TRUE, message=FALSE, warning=FALSE----------------
knitr::opts_chunk$set(eval = FALSE, echo = TRUE, warning = FALSE,
                      message = FALSE, comment = NA)

# CRAN Packages 
# -------------
# If any of these packages are not installed, write
# install.packages("<name of package>")
# e.g., install.packages("MultipleBubbles")

library(psymonitor)  # For testting for bubble monitoring
library(ggplot2)     # To handle plots
library(knitr)       # for nice looking tables


## ----readData, include=TRUE, message=FALSE, warning=FALSE----------------
#  data(snp)
#  snp$pd <-  1/snp$value
#  head(snp)

## ----plot, echo=FALSE, fig.width=8,fig.height=5,warning=FALSE------------
#  ggplot(snp, aes(date, pd)) +
#    geom_line() +
#    ggtitle("Figure 1: S&P 500 Price-to-dividend Ratio") +
#    xlab("Year") +
#    ylab("Ratio")

## ----setup, include=TRUE, message=FALSE, warning=FALSE-------------------
#  y        <- snp$pd
#  obs      <- length(y)
#  r0       <- 0.01 + 1.8/sqrt(obs)
#  swindow0 <- floor(r0*obs)
#  dim      <- obs - swindow0 + 1
#  IC       <- 2
#  adflag   <- 6
#  yr       <- 2
#  Tb       <- 12*yr + swindow0 - 1
#  nboot    <- 99

## ----PSY, include=TRUE, message=FALSE, warning=FALSE---------------------
#  bsadf          <- PSY(y, swindow0, IC, adflag)
#  quantilesBsadf <- cvPSYwmboot(y, swindow0, IC, adflag, Tb, nboot, nCores = 2) #Note that the number of cores is arbitrarily set to 2.

## ----dateStamp, include=TRUE, message=FALSE, warning=FALSE---------------
#  monitorDates <- snp$date[swindow0:obs]
#  quantile95   <- quantilesBsadf %*% matrix(1, nrow = 1, ncol = dim)
#  ind95        <- (bsadf > t(quantile95[2, ])) * 1
#  periods      <- locate(ind95, monitorDates)

## ----printResults, include=TRUE, message=FALSE, warning=FALSE, results = 'asis'----
#  bubbleDates <- disp(periods, obs)
#  kable(bubbleDates, caption = "Bubble and Crisis Periods in the S&P 500")

## ----dateStampPlot, fig.width=8,fig.height=5,include=TRUE, message=FALSE, warning=FALSE----
#  
#  ggplot() +
#    geom_rect(data = bubbleDates, aes(xmin = start, xmax = end,
#                                ymin = -Inf, ymax = Inf), alpha = 0.5) +
#    geom_line(data = snp, aes(date, pd)) +
#    labs(title = "Figure 2: S&P 500 Price-to-Dividend Ratio",
#         subtitle = "January 1973 - July 2018",
#         caption = "Notes: The solid
#  line is the price-to-dividend ratio and the shaded areas are the periods where
#  the PSY statistic exceeds its 95% bootstrapped critical value.",
#         x = "Year", y = "Ratio")

