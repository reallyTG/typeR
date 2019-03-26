## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----initialize,echo=TRUE------------------------------------------------
library(baytrends)

## ----usgsgages, echo=FALSE, results='asis'-------------------------------
.T("Chesapeake Bay River Input Monitoring Stations",1,'e')
knitr::kable(usgsGages)

## ----flow, eval=FALSE, results='asis', fig.height=6.5, fig.width=6.5-----
#  # Define Function Inputs
#  usgsGageID    <- usgsGages$usgsGageID # all RIM stations
#  siteName      <- usgsGages$siteName   # all RIM stations
#  yearStart     <- 1983
#  yearEnd       <- 2017
#  dvAvgWinSel   <- c(1, 5, 10, 15, 20, 30, 40, 50, 60, 90, 120, 150, 180, 210)
#  dvAvgWgtSel   <- "uniform"
#  dvAvgSidesSel <- 1
#  lowess.f      <- 0.2
#  
#  # Run detrended.flow function
#  flow.detrended <- detrended.flow(usgsGageID, siteName, yearStart, yearEnd
#                                   , dvAvgWinSel, dvAvgWgtSel, dvAvgSidesSel
#                                   , lowess.f)
#  
#  # Save list to data file separate use
#  save(flow.detrended, file='mySeasonallyDetrendedFlow.rda')

## ----flow1, eval=TRUE, echo=FALSE, results='asis', fig.height=4.5, fig.width=6.5----

# Define Function Inputs
usgsGageID    <- c("01578310")
siteName      <- c("Susquehanna River at Conowingo, MD")
yearStart     <- 2003 #1983
yearEnd       <- 2017
dvAvgWinSel   <- c(1, 10)
dvAvgWgtSel   <- "uniform"
dvAvgSidesSel <- 1
lowess.f      <- 0.2

# Run detrended.flow function
flow.detrended <- detrended.flow(usgsGageID, siteName, yearStart, yearEnd
                                 , dvAvgWinSel, dvAvgWgtSel, dvAvgSidesSel
                                 , lowess.f)

## ----salinity0, echo=FALSE, results='asis'-------------------------------
.T("Example Salinity Data",2,'e')
knitr::kable(head(sal[sal$layer %in% c('S', 'B') , ]),row.names = FALSE)

.T("Data Structure Associated with sal",3,'e')

## ----salinity1, echo=FALSE, results='markup'-----------------------------
str(sal)

## ----salinity2, eval=FALSE, results='asis', fig.height=6.5, fig.width=6.5----
#  
#  # Define Function Inputs
#  df.sal      <- sal
#  dvAvgWinSel <- 30
#  lowess.f    <- 0.2
#  minObs      <- 40
#  minObs.sd   <- 10
#  
#  # Run Function
#  salinity.detrended <- detrended.salinity(df.sal, dvAvgWinSel,
#                                   lowess.f, minObs, minObs.sd)
#  
#  # Save list to data file separate use
#  save(salinity.detrended, file='mySeasonallyDetrendedSalinity.rda')

## ----salinity3, eval=TRUE, echo=FALSE, results='asis', fig.height=4.5, fig.width=6.5----
# Define Function Inputs
df.sal      <- sal[sal$station=="CB5.4", ]
dvAvgWinSel <- 30
lowess.f    <- 0.2
minObs      <- 40
minObs.sd   <- 10
                 
# Run Function
salinity.detrended <- detrended.salinity(df.sal, dvAvgWinSel, lowess.f, minObs, minObs.sd) 

## ----gamTrendExample, eval=TRUE, results='asis', fig.height=3.5, fig.width=6.5----
dfr       <- analysisOrganizeData(dataCensored, reports = NA)
df        <- dfr[["df"]]
analySpec <- dfr[["analySpec"]]

# down select analyzed GAM
analySpec$gamModels <- analySpec$gamModels[5]

stat = 'CB5.4'; dep = 'tn'; layer = 'S';
gamResult <- gamTest(df, dep, stat, layer, analySpec
                     , salinity.detrended=salinity.detrended)


