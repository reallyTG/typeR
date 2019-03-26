## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = F,
  fig.align = "center"
)

devtools::load_all()
library(tidyverse)
library(tibbletime)

## ---- eval = F-----------------------------------------------------------
#  library(tidyverse)
#  library(tibbletime)
#  library(anomalize)

## ------------------------------------------------------------------------
tidyverse_cran_downloads

## ------------------------------------------------------------------------
tidyverse_cran_downloads_anomalized <- tidyverse_cran_downloads %>%
    time_decompose(count, merge = TRUE) %>%
    anomalize(remainder) %>%
    time_recompose()

tidyverse_cran_downloads_anomalized %>% glimpse()

## ---- fig.height=8, fig.width=6------------------------------------------
tidyverse_cran_downloads_anomalized %>%
    plot_anomalies(ncol = 3, alpha_dots = 0.25)

## ------------------------------------------------------------------------
lubridate_daily_downloads <- tidyverse_cran_downloads %>%
    filter(package == "lubridate") %>%
    ungroup()

lubridate_daily_downloads

## ------------------------------------------------------------------------
lubridate_daily_downloads_anomalized <- lubridate_daily_downloads %>% 
    time_decompose(count) %>%
    anomalize(remainder) %>%
    time_recompose()

lubridate_daily_downloads_anomalized %>% glimpse()

## ---- fig.width=5, fig.height=6------------------------------------------
p1 <- lubridate_daily_downloads_anomalized %>%
    plot_anomaly_decomposition() +
    ggtitle("Freq/Trend = 'auto'")

p1

## ------------------------------------------------------------------------
get_time_scale_template()

## ---- fig.show="hold", fig.height=6, fig.align="default"-----------------
# Local adjustment via time_decompose
p2 <- lubridate_daily_downloads %>%
    time_decompose(count,
                   frequency = "auto",
                   trend     = "2 weeks") %>%
    anomalize(remainder) %>%
    plot_anomaly_decomposition() +
    ggtitle("Trend = 2 Weeks (Local)")

# Show plots
p1
p2

## ------------------------------------------------------------------------
# Globally change time scale template options
time_scale_template() %>%
    mutate(trend = ifelse(time_scale == "day", "2 weeks", trend)) %>%
    set_time_scale_template()

get_time_scale_template()

## ---- fig.width=5, fig.height=6------------------------------------------
p3 <- lubridate_daily_downloads %>%
    time_decompose(count) %>%
    anomalize(remainder) %>%
    plot_anomaly_decomposition() +
    ggtitle("Trend = 2 Weeks (Global)")

p3

## ------------------------------------------------------------------------
# Set time scale template to the original defaults
time_scale_template() %>%
    set_time_scale_template()

# Verify the change
get_time_scale_template()

## ---- fig.height=5, fig.width=5------------------------------------------
p4 <- lubridate_daily_downloads %>%
    time_decompose(count) %>%
    anomalize(remainder, alpha = 0.05, max_anoms = 0.2) %>%
    time_recompose() %>%
    plot_anomalies(time_recomposed = TRUE) +
    ggtitle("alpha = 0.05")

p4

## ---- fig.show="hold", fig.align="default"-------------------------------
p5 <- lubridate_daily_downloads %>%
    time_decompose(count) %>%
    anomalize(remainder, alpha = 0.025, max_anoms = 0.2) %>%
    time_recompose() %>%
    plot_anomalies(time_recomposed = TRUE) +
    ggtitle("alpha = 0.025")

p4 
p5

## ---- fig.show="hold", fig.align="default"-------------------------------
p6 <- lubridate_daily_downloads %>%
    time_decompose(count) %>%
    anomalize(remainder, alpha = 0.3, max_anoms = 0.2) %>%
    time_recompose() %>%
    plot_anomalies(time_recomposed = TRUE) +
    ggtitle("20% Anomalies")

p7 <- lubridate_daily_downloads %>%
    time_decompose(count) %>%
    anomalize(remainder, alpha = 0.3, max_anoms = 0.05) %>%
    time_recompose() %>%
    plot_anomalies(time_recomposed = TRUE) +
    ggtitle("5% Anomalies")

p6
p7

