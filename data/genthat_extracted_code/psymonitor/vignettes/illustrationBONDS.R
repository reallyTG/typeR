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
#  data(spread)
#  kable(head(spread))

## ----plotSpread, fig.width=8,fig.height=5, warning=FALSE-----------------
#  
#  ggplot(spread, aes(date, value)) +
#    geom_line() +
#    ggtitle("Figure 1: Credit Risk in the European Sovereign Sector") +
#    xlab("Year") +
#    ylab("Index")
#  

## ----setup, include=TRUE, message=FALSE, warning=FALSE-------------------
#  y        <- spread$value
#  obs      <- length(y)
#  r0       <- 0.01 + 1.8/sqrt(obs)
#  swindow0 <- floor(r0*obs)
#  dim      <- obs - swindow0 + 1
#  IC       <- 2
#  adflag   <- 6
#  yr       <- 2
#  Tb       <- 12*yr + swindow0 - 1
#  nboot    <- 99
#  

## ----PSY, include=TRUE, message=FALSE, warning=FALSE---------------------
#  bsadf          <- PSY(y, swindow0, IC, adflag)
#  quantilesBsadf <- cvPSYwmboot(y, swindow0, IC, adflag, Tb, nboot, nCores = 2) # Note that the number of cores is arbitrarily set to 2.

## ----dateStamp, include=TRUE, message=FALSE, warning=FALSE---------------
#  monitorDates <- spread$date[swindow0:obs]
#  quantile95   <- quantilesBsadf %*% matrix(1, nrow = 1, ncol = dim)
#  ind95        <- (bsadf > t(quantile95[2, ])) * 1
#  periods      <- locate(ind95, monitorDates)

## ----printResults, include=TRUE, message=FALSE, warning=FALSE, results = 'asis'----
#  crisisDates <- disp(periods, obs)
#  kable(crisisDates, caption = "Crisis Periods in the European Soevereign Debt Market")

## ----dateStampPlot, fig.width=8,fig.height=5,include=TRUE, message=FALSE, warning=FALSE----
#  
#  ggplot() +
#    geom_rect(data = crisisDates, aes(xmin = start, xmax = end,
#                                ymin = -Inf, ymax = Inf), alpha = 0.5) +
#    geom_line(data = spread, aes(date, value)) +
#    labs(title = "Figure 2: Crisis episodes in the European Sovereign Sector",
#         subtitle = "June 1997 - June 2016",
#         caption = "Notes: The solid line is the 10-year government bond yield spread between the PIIGS countries and Germany and the shaded areas are the periods where the PSY statistic exceeds its 95% bootstrap critical value.",
#         x = "Year", y = "Index")

