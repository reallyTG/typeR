## ----setup, echo = FALSE, message = FALSE--------------------------------
library(knitr)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "VIGNETTE-")

set.seed(42)


## ----out.width = "100%", echo = FALSE------------------------------------
include_graphics("VIGNETTE-spreadsheet-screenshot.png")

## ----out.width = "100%", echo = FALSE------------------------------------
include_graphics("VIGNETTE-6202-screenshot.png")

## ----read-wpi-all--------------------------------------------------------
library(readabs)

wpi <- read_abs("6345.0")

## ----glimpse-wpi---------------------------------------------------------
library(dplyr)

glimpse(wpi)

## ----read-wpi-nometadata, eval = FALSE-----------------------------------
#  wpi_nometadata <- read_abs("6345.0", metadata = FALSE)

## ----read-lfs-1----------------------------------------------------------

lfs_1 <- read_abs("6202.0", tables = 1)

glimpse(lfs_1)


## ----read-lfs-1-5--------------------------------------------------------

lfs_1_5 <- read_abs("6202.0", tables = c(1, 5))

glimpse(lfs_1_5)


## ----examine-lfs---------------------------------------------------------
unique(lfs_1$series)

## ----create-unemp-df-----------------------------------------------------

unemp <- lfs_1 %>%
  filter(grepl("Unemployment rate", series))

unique(unemp$series)


## ----filter-male-female--------------------------------------------------

unemp <- unemp %>%
  filter(grepl("Males", series) | grepl("Females", series)) %>%
  filter(!grepl("looked for", series)) 

unique(unemp$series)

## ----graph-unemp, dpi = 200----------------------------------------------
library(ggplot2)

unemp %>%
  filter(series_type == "Seasonally Adjusted") %>%
  mutate(sex = if_else(grepl("Males", series), "Males", "Females")) %>%
  ggplot(aes(x = date, y = value, col = sex)) +
  geom_line() +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.title = element_blank(),
        legend.title = element_blank(),
        text = element_text(size = 5)) +
  labs(title = "The male and female unemployment rates have converged",
       subtitle = "Unemployment rates for Australian men and women (aged 15+), 1978-2018 (per cent)",
       caption = "Source: ABS 6202.0")

## ----read-lfs-local------------------------------------------------------

lfs_local <- read_abs_local(c("6202001.xls", "6202005.xls"))


