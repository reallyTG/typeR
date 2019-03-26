## ----message=FALSE, echo=FALSE-------------------------------------------
library(timeDate)
library(EpiCurve)
library(scales)
library(knitr)

## ------------------------------------------------------------------------
DF <- read.csv("daily_unaggregated_cases.csv", stringsAsFactors=FALSE)
kable(head(DF, 12))

## ----fig.width=6, fig.height=4.5-----------------------------------------
EpiCurve(DF,
         date = "UTS",
         period = "day",
         color ="#9900ef",
         xlabel=sprintf("From %s to %s", min(DF$UTS), max(DF$UTS)))

## ------------------------------------------------------------------------
DF <- read.csv("hourly_unaggregated_cases.csv", stringsAsFactors=FALSE)
kable(head(DF, 12))

## ----fig.width=5.5, fig.height=4.2---------------------------------------
EpiCurve(DF,
         date = "UTS",
         period = "hour",
         split = 1,
         color ="#339933",
         ylabel="Number of cases",
         xlabel=sprintf("From %s to %s", min(DF$UTS), max(DF$UTS)))

## ------------------------------------------------------------------------
DF <- read.csv("hourly_unaggregated_cases_factors.csv", stringsAsFactors=FALSE)
kable(head(DF, 12))

## ----fig.width=5.5, fig.height=4.2---------------------------------------
EpiCurve(DF,
         date = "UTS",
         period = "hour",
         split = 1,
         cutvar = "Confirmed",
         color = c("#339933","#eebb00"),
         xlabel=sprintf("From %s to %s", min(DF$UTS), max(DF$UTS)))

## ----echo=FALSE, warning=FALSE, , message=FALSE--------------------------
library(timeDate)
library(ggplot2)
library(EpiCurve)
library(scales)
library(knitr)


## ---- echo=FALSE, message=FALSE------------------------------------------
DF <- read.csv("daily_aggregated_cases.csv", stringsAsFactors=FALSE)
# DF$date <- as.Date(DF$date)
kable(DF)


## ------------------------------------------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "day",
         ylabel="Number of cases",
         xlabel=sprintf("From %s to %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve",
         note = "Daily epidemic curve")



## ---- echo=FALSE, message=FALSE------------------------------------------
DF <- read.csv("daily_aggregated_cases_factors.csv", stringsAsFactors=FALSE)
# DF$date <- as.Date(DF$date)
kable(DF)

## ------------------------------------------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         cutvar = "factor",
         period = "day",
         ylabel="Number of cases",
         xlabel=sprintf("From %s to %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve",
         note = "Daily epidemic curve")



## ---- echo=FALSE---------------------------------------------------------
DF <- read.csv("weekly_aggregated_cases.csv", stringsAsFactors=FALSE)
kable(DF)


## ----fig.width=4.5, fig.height=4.5---------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "week",
         color=c("#990000"),
         ylabel="Number of cases",
         xlabel=sprintf("Du %s au %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve\n")


## ---- echo=FALSE---------------------------------------------------------
DF <- read.csv2("weekly_aggregated_cases_factors.csv", stringsAsFactors=FALSE)
kable(DF)


## ----fig.width=4, fig.height=4-------------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "week",
         cutvar = "factor",
         color=c("Blue", "Red"),
         ylabel="Cases",
         xlabel=sprintf("From %s to %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve\n")


## ---- echo=FALSE---------------------------------------------------------
DF <- read.csv2("monthly_aggregated_cases.csv", stringsAsFactors=FALSE)
kable(DF)


## ----fig.width=4.5, fig.height=4.5---------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "month",
         ylabel="Number of cases",
         xlabel=sprintf("From %s to %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve\n")


## ---- echo=FALSE---------------------------------------------------------
DF <- read.csv2("monthly_aggregated_cases_factors.csv", stringsAsFactors=FALSE)
kable(DF)


## ----fig.width=4, fig.height=4-------------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         cutvar = "factor",
         period = "month",
         ylabel="Number of cases",
         xlabel=sprintf("From %s to %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve\n")


## ---- echo=FALSE, message=FALSE------------------------------------------
DF <- read.csv("daily_aggregated_cases.csv", stringsAsFactors=FALSE)
# DF$date <- as.Date(DF$date)
kable(DF)


## ----fig.height=8, fig.width=8-------------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "day",
         to.period = "week",
         ylabel="Number of cases",
         xlabel=sprintf("From %s to %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve",
         note = "Daily epidemic curve")



## ----fig.height=7--------------------------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "day",
         to.period = "month",
         ylabel="Number of cases",
         xlabel=sprintf("From %s o %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve",
         note = "Daily epidemic curve")



## ---- echo=FALSE---------------------------------------------------------
DF <- read.csv("weekly_aggregated_cases.csv", stringsAsFactors=FALSE)
kable(DF)


## ----fig.width=4.5, fig.height=4.5---------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "week",
         to.period = "month",
         color=c("#990000"),
         ylabel="Number of cases",
         xlabel=sprintf("Du %s au %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve\n")


## ---- echo=FALSE---------------------------------------------------------
DF <- read.csv2("weekly_aggregated_cases_factors.csv", stringsAsFactors=FALSE)
kable(DF)


## ----fig.width=4, fig.height=4-------------------------------------------
EpiCurve(DF,
         date = "date",
         freq = "value",
         period = "week",
         to.period = "month",
         cutvar = "factor",
         color=c("Blue", "Red"),
         ylabel="Cases",
         xlabel=sprintf("From %s to %s", min(DF$date), max(DF$date)),
         title = "Epidemic Curve\n")


