## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- echo = T, warning = F, message=F-----------------------------------
library("lubridate")
library("dplyr")
library("ggplot2")
library("DT")
library("plotly")
library("RColorBrewer")

## ---- include=TRUE, cache=FALSE, message=FALSE, warning=FALSE, eval=F----
#  install.packages("ActisoftR")
#  library("ActisoftR")

## ---- eval = F-----------------------------------------------------------
#  devtools::install_github("SWRC/ActisoftR")

## ---- include=TRUE, echo = T, warning = F, message=F, eval=T-------------
library("ActisoftR")
data("act")

## ---- eval = F-----------------------------------------------------------
#  act <- read_actigraph_csv(x = "C:\\1\\EXAMPLE_DATA")

## ---- include=TRUE, cache=FALSE, message=FALSE, warning=FALSE------------
data("act")
datatable(act[order(act$datime_start),] , filter = 'top', width = 800, height = 800)

## ---- fig.width=11, fig.height=10, fig.cap="\\label{fig:f2}  Fig.2: Impact of overseas travel on sleep timing using a long plot containing 61 days from participant 1."----
act[act$subject_ID == 1 & act$interval_type != "ACTIVE",] %>%
plot_long(., si = c(3, 2.5, 2, 1.5), 
          tz2 = "Pacific/Auckland", 
          acolor = c("#D55E00", "black", "#56B4E9"),
          with_date = T)


## ---- fig.width=9, fig.height=4, fig.cap="\\label{fig:f2}  Fig.3:Darwent plot of the first 15 days of the three participants in dataset ```act```."----
act %>% group_by(subject_ID) %>% 
  mutate(start = min(datime_start)) %>% 
  ungroup %>% filter(datime_start <= start + days(15), interval_type != "ACTIVE") %>%
  plot_Darwent(.,  acolor = c("#D55E00", "black", "#56B4E9"), 
               tz2 = "Pacific/Auckland",
               si = c(4, 3, 2.5))


## ------------------------------------------------------------------------
par <- data.frame(subject_ID = 1,
                 summary_duration_h = 24, 
                 summary_type = "sequential",
                 summary_start_datime = ymd_hms("2017-12-05 00:00:00 UTC"),
                 summary_end_datime = ymd_hms("2017-12-15 00:00:00 UTC"))

par

## ---- warning=F----------------------------------------------------------
rep <- report_period(period = par , acti_data = act)
datatable(rep)

## ------------------------------------------------------------------------
start_date <- act[act$subject_ID==1 & act$interval_type == "FLIGHT" & act$comments == "SIN-AMS",]$datime_end
start_date
sel <- act[act$datime_start >= start_date & act$datime_end <= start_date + days(10),]

## ---- warning=F----------------------------------------------------------
par_afterflight <- data.frame(subject_ID = 1,
                  summary_duration_h = 24, 
                  summary_type = "sequential",
                  summary_start_datime = round.POSIXt(start_date, "day"),
                  summary_end_datime = round.POSIXt(start_date, "day") + days(10))


rep_afterflight <- report_period(period = par_afterflight , acti_data = sel)

## ------------------------------------------------------------------------
baseline <- data.frame(subject_ID = 1, baseline_sleep = mean(rep$total_sleep))

## ------------------------------------------------------------------------
reset <- 2
z <- csd(x = rep_afterflight, baseline_sleep = baseline, reset = 2)
datatable(z[[2]])

## ---- fig.cap="\\label{fig:f2}  Fig.4: Cumulative sleep debt of the first participant 10 days after the flight from Singapore to Amsterdam (SIN-AMS)."----
plot(z[[1]])

## ---- eval = F-----------------------------------------------------------
#  sheep_counter(data, tz = "UTC", interv = "10 mins", datebreaks = "2 hour")

