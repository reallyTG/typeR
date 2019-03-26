## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(tbrf)
library(dplyr)
library(ggplot2)
set.seed(1014)

## ------------------------------------------------------------------------
data("Dissolved_Oxygen")

head(Dissolved_Oxygen)

## ------------------------------------------------------------------------
tbr_mean(Dissolved_Oxygen, x = Average_DO,
         tcolumn = Date, unit = "years", n = 10)

## ------------------------------------------------------------------------
Dissolved_Oxygen %>%
  group_by(Station_ID) %>%
  tbr_mean(Average_DO, Date, "years", 10)

## ------------------------------------------------------------------------
# Some sample data
df <- data_frame(date = sample(seq(as.Date('2000-01-01'),
                                   as.Date('2005-12-30'), by = "day"), 25)) %>%
  bind_rows(data.frame(date = sample(seq(as.Date('2009-01-01'),
                                         as.Date('2011-12-30'), by = "day"), 25))) %>%
  arrange(date) %>%
  mutate(value = 1:50)

## ---- fig.width=7--------------------------------------------------------
df %>%
  tbr_misc(x = value, tcolumn = date, unit = "years", n = 5, func = length) %>%
  ggplot() +
  geom_point(aes(date, value)) +
  geom_errorbarh(aes(xmin = min_date, xmax = max_date, 
                     y = value, color = results)) +
  scale_color_distiller(type = "seq", palette = "OrRd", 
                        direction = 1) +
  guides(color = guide_colorbar(title = "Number of samples")) +
  theme(legend.position = "bottom") +
  labs(x = "Sample Date", y = "Sample Value",
       title = "Window length and n",
       caption = "Lines depict width of samples included in the time window\nColors indicate number of samples in the time window")

## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
data("Dissolved_Oxygen")

Dissolved_Oxygen %>%
  mutate(x = case_when(
    Average_DO >= 5 ~ 0,
    Average_DO < 5 ~ 1)) %>%
  tbr_binom(x, Date, "years", 7, alpha = 0.05) %>%
  ggplot() +
  geom_line(aes(x = Date, y = PointEst)) +
  geom_ribbon(aes(x = Date, ymin = Lower, ymax = Upper), alpha = 0.5)


## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
library(ggalt)

data_frame(date = sample(seq(as.Date('2001-01-01'),
                                   as.Date('2017-12-31'), 
                                   by = "day"), 
                               60),
                 x = rexp(60, 1/1000)) %>%
  tbr_gmean(x, date, "years", 7, conf = 0.95, type = "perc") %>%
  ggplot() +
  geom_point(aes(date, x), alpha = 0.5) +
  geom_step(aes(date, mean)) +
  geom_ribbon(aes(x = date, ymin = lwr_ci, ymax = upr_ci), alpha = 0.5, stat = "stepribbon") +
  scale_y_log10()



## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
Dissolved_Oxygen %>%
  mutate(Station_ID = as.factor(Station_ID)) %>%
  group_by(Station_ID) %>%
  tbr_mean(Average_DO, Date, "years", 7, conf = 0.95, type = "perc") %>%
  ggplot() +
  geom_point(aes(Date, Average_DO, color = Station_ID), alpha = 0.5) +
  geom_step(aes(Date, mean, color = Station_ID)) +
  geom_ribbon(aes(x = Date, ymin = lwr_ci, ymax = upr_ci, fill = Station_ID), alpha = 0.5, stat = "stepribbon")

## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
Dissolved_Oxygen %>%
  mutate(Station_ID = as.factor(Station_ID)) %>%
  group_by(Station_ID) %>%
  tbr_median(Average_DO, Date, "years", 7, conf = 0.95, type = "perc") %>%
  ggplot() +
  geom_point(aes(Date, Average_DO, color = Station_ID), alpha = 0.5) +
  geom_step(aes(Date, median, color = Station_ID)) +
  geom_ribbon(aes(x = Date, ymin = lwr_ci, ymax = upr_ci, fill = Station_ID), alpha = 0.5, stat = "stepribbon")

## ------------------------------------------------------------------------
Dissolved_Oxygen %>%
  tbr_misc(Average_DO, Date, "years", 7, func = min) %>%
  ggplot() +
  geom_point(aes(Date, Average_DO), alpha = 0.5) +
  geom_line(aes(Date, results))

## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
Dissolved_Oxygen %>%
  tbr_sd(Average_DO, Date, "years", 7) %>%
  ggplot() +
  geom_line(aes(Date, sd))

## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
Dissolved_Oxygen %>%
  mutate(Station_ID = as.factor(Station_ID)) %>%
  group_by(Station_ID) %>%
  tbr_sum(Average_DO, Date, "years", 7) %>%
  ggplot() +
  geom_line(aes(Date, sum, color = Station_ID))

## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
y = 3 * sin(2 * seq(from = 0, to = 4*pi, length.out = 100)) + rnorm(100)
time = sample(seq(as.POSIXct(strptime("2017-01-01 00:01:00", "%Y-%m-%d %H:%M:%S")),
                  as.POSIXct(strptime("2017-01-01 23:00:00", "%Y-%m-%d %H:%M:%S")),
                  by = "min"), 100)

df <- data_frame(y, time)

df %>%
  tbr_mean(y, time, "minutes", n = 30) %>%
  ggplot() +
  geom_point(aes(time, y)) +
  geom_line(aes(time, mean))


df %>%
  tbr_mean(y, time, "minutes", n = 60) %>%
  ggplot() +
  geom_point(aes(time, y)) +
  geom_line(aes(time, mean))


df %>%
  tbr_mean(y, time, "hours", n = 5) %>%
  ggplot() +
  geom_point(aes(time, y)) +
  geom_line(aes(time, mean))


## ----eval=FALSE, message=FALSE, warning=FALSE, paged.print=FALSE---------
#  library(snow)
#  
#  cl <- makeCluster(4, type = "SOCK")
#  
#  tbr_mean(Dissolved_Oxygen, Average_DO, Date,
#           "years", 5, R = 1000, conf = .95,
#           type = "perc", parallel = "snow",
#           cl = cl)
#  
#  stopCluster(cl)

