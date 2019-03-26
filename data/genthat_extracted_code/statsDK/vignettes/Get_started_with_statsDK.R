## ---- warning=FALSE, message=FALSE---------------------------------------
library(statsDK); library(dplyr); library(stringr); library(lubridate); library(ggplot2); library(tidyr)

tables <- retrieve_tables()

glimpse(tables)

## ------------------------------------------------------------------------
tables_long <- tables %>%
  unnest(variables)

## ------------------------------------------------------------------------

marriage_tables <- tables_long %>%
  filter(str_detect(tables_long$variables, "marriage"))

glimpse(marriage_tables)


## ------------------------------------------------------------------------
viedag_meta <- retrieve_metadata("VIEDAG")

glimpse(viedag_meta)

## ------------------------------------------------------------------------
variables <- get_variables(viedag_meta)

glimpse(variables)

## ------------------------------------------------------------------------
variable_overview <- variables %>% 
  group_by(param) %>%
  slice(c(1, round(n()/2), n())) %>%
  ungroup()

variable_overview

## ------------------------------------------------------------------------
VIEDAG <- retrieve_data("VIEDAG", Tid = "*", VDAG = "TOT", VIMDR = "006,012")
names(VIEDAG) <- c("time", "day", "month", "count")

## ------------------------------------------------------------------------
glimpse(VIEDAG)

## ---- fig.width=4*1.618, fig.height=4------------------------------------

VIEDAG$time <- ymd(paste0(VIEDAG$time, "-01-01"))

ggplot(VIEDAG) +
  geom_line(aes(x = time, count, group = month)) +
  annotate("text", x = max(VIEDAG$time) %m+% months(1) , y = c(3396, 1721), 
           label = c("June", "December"), hjust = 0) +
  annotate("point", x = max(VIEDAG$time), y = c(3396, 1721)) +
  xlim(min(VIEDAG$time), max(VIEDAG$time) %m+% years(1) ) +
  labs(y = "Total marriages for the given month", x = "Years") +
  theme_minimal()

