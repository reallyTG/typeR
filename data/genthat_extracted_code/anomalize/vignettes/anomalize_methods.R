## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = F,
  fig.align = "center"
)

devtools::load_all()
library(tidyverse)

## ---- eval = F-----------------------------------------------------------
#  library(tidyverse)
#  library(anomalize)

## ------------------------------------------------------------------------
# Data on `lubridate` package daily downloads
lubridate_download_history <- tidyverse_cran_downloads %>%
    filter(package == "lubridate") %>%
    ungroup()

# Output first 10 observations
lubridate_download_history %>%
    head(10) %>%
    knitr::kable()

## ---- fig.show='hold', fig.height=7, fig.align='default'-----------------
# STL Decomposition Method
p1 <- lubridate_download_history %>%
    time_decompose(count, 
                   method    = "stl",
                   frequency = "1 week",
                   trend     = "3 months") %>%
    anomalize(remainder) %>%
    plot_anomaly_decomposition() +
    ggtitle("STL Decomposition")

# Twitter Decomposition Method
p2 <- lubridate_download_history %>%
    time_decompose(count, 
                   method    = "twitter",
                   frequency = "1 week",
                   trend     = "3 months") %>%
    anomalize(remainder) %>%
    plot_anomaly_decomposition() +
    ggtitle("Twitter Decomposition")

# Show plots
p1
p2

## ---- fig.height=3, fig.width=5------------------------------------------
# Generate anomalies
set.seed(100)
x <- rnorm(100)
idx_outliers    <- sample(100, size = 5)
x[idx_outliers] <- x[idx_outliers] + 10

# Visualize simulated anomalies
qplot(1:length(x), x, 
      main = "Simulated Anomalies",
      xlab = "Index") 

## ---- fig.show="hold", fig.width=5---------------------------------------
# Analyze outliers: Outlier Report is available with verbose = TRUE
iqr_outliers <- iqr(x, alpha = 0.05, max_anoms = 0.2, verbose = TRUE)$outlier_report

gesd_outliers <- gesd(x, alpha = 0.05, max_anoms = 0.2, verbose = TRUE)$outlier_report

# ploting function for anomaly plots
ggsetup <- function(data) {
    data %>%
        ggplot(aes(rank, value, color = outlier)) +
        geom_point() +
        geom_line(aes(y = limit_upper), color = "red", linetype = 2) +
        geom_line(aes(y = limit_lower), color = "red", linetype = 2) +
        geom_text(aes(label = index), vjust = -1.25) +
        theme_bw() +
        scale_color_manual(values = c("No" = "#2c3e50", "Yes" = "#e31a1c")) +
        expand_limits(y = 13) +
        theme(legend.position = "bottom")
}
    

# Visualize
p3 <- iqr_outliers %>% 
    ggsetup() +
    ggtitle("IQR: Top outlers sorted by rank") 

p4 <- gesd_outliers %>% 
    ggsetup() +
    ggtitle("GESD: Top outlers sorted by rank") 
    
# Show plots
p3
p4

