## ----global_options, include = FALSE-------------------------------------
knitr::opts_chunk$set(fig.width = 8, fig.height = 3, fig.align = 'centre',
                      echo = TRUE, warning = FALSE, message = FALSE,
                      eval = TRUE, tidy = FALSE)

## ----exceedance-example1-------------------------------------------------
# Activate libraries
library(heatwaveR)
library(dplyr)

# Calculate exceedence
exc_25 <- exceedance(sst_WA, threshold = 25)

# Look at a few metrics
exc_25$exceedance %>%
  ungroup() %>%
  select(exceedance_no, duration, date_start, date_peak, intensity_max, intensity_cumulative) %>%
  dplyr::arrange(-intensity_cumulative) %>%
  head(5)

## ----fig-example1, echo = TRUE, eval = TRUE------------------------------
exc_25_thresh <- exc_25$threshold %>% 
  slice(9500:9866)

ggplot(data = exc_25_thresh, aes(x = t)) +
  geom_flame(aes(y = temp, y2 = thresh, fill = "all"), show.legend = F) +
  geom_line(aes(y = temp, colour = "temp")) +
  geom_line(aes(y = thresh, colour = "thresh"), size = 1.0) +
  scale_colour_manual(name = "Line Colour",
                      values = c("temp" = "black", "thresh" =  "forestgreen")) +
  scale_fill_manual(name = "Event Colour", values = c("all" = "salmon")) +
  guides(colour = guide_legend(override.aes = list(fill = NA))) +
  scale_x_date(date_labels = "%b %Y") +
  labs(y = expression(paste("Temperature [", degree, "C]")), x = NULL)

## ----exceedance-example2-------------------------------------------------
exc_19 <- exceedance(sst_WA, threshold = 19, below = TRUE)
exc_19$exceedance %>%
  dplyr::ungroup() %>%
  dplyr::select(exceedance_no, duration, date_start, date_peak, intensity_mean, intensity_cumulative) %>%
  dplyr::arrange(intensity_cumulative) %>%
  head(5)

## ----fig-example2, echo = TRUE, eval = TRUE------------------------------
exc_19_thresh <- exc_19$threshold %>% 
  slice(1500:1866)

ggplot(data = exc_19_thresh, aes(x = t)) +
  geom_flame(aes(y = thresh, y2 = temp), fill = "steelblue3", show.legend = F) +
  geom_line(aes(y = temp, colour = "temp")) +
  geom_line(aes(y = thresh, colour = "thresh"), size = 1.0) +
  scale_colour_manual(name = "Line Colour",
                      values = c("temp" = "black", "thresh" =  "forestgreen")) +
  scale_y_continuous(limits = c(18, 23.5)) +
  scale_x_date(date_labels = "%b %Y") +
  labs(y = expression(paste("Temperature [", degree, "C]")), x = NULL)

