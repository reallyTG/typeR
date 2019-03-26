## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, 
  comment = "#>",
  fig.width = 7.15,
  fig.height = 3.5)

library(qicharts2)

## ---- echo=FALSE---------------------------------------------------------
qic(month, n,
    data  = head(cdi, 24),
    chart = 'c',
    title = 'C control chart for hospital acquired Clostridium difficile infections',
    ylab  = 'Count',
    xlab  = 'Month')

## ---- echo=FALSE---------------------------------------------------------
paretochart(unlist(gtt[7:11]),
            title = 'Pareto chart of patient harm during hospitalisation')

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('qicharts2')

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github('anhoej/qicharts2', build_vignettes = TRUE)

## ------------------------------------------------------------------------
# Load qicharts2
library(qicharts2)

# Lock random number generator to make examples reproducible.
set.seed(19)

# Generate 24 random numbers from a normal distribution.
y <- rnorm(24)

## ------------------------------------------------------------------------
qic(y)

## ------------------------------------------------------------------------
qic(y, chart = 'i')

## ------------------------------------------------------------------------
# Simulate a special cause to y in the form of a large, transient shift of 4 standard deviations.
y[22] <- 4

qic(y, chart = 'i')

## ------------------------------------------------------------------------
# Simulate a special cause to y in the form of a moderate, persistent shift of 2 standard deviations.
y[13:24] <- rnorm(12, mean = 2)

qic(y, chart = 'i')

## ------------------------------------------------------------------------
# Save qic object to o
o <- qic(y, chart = 'i')

# Print summary data frame
summary(o)

## ------------------------------------------------------------------------
head(gtt)

## ------------------------------------------------------------------------
qic(month, harms, days,
    data     = gtt,
    multiply = 1000,
    title    = 'Patient harm',
    ylab     = 'Adverse events per 1000 patient days',
    xlab     = 'Month')

## ------------------------------------------------------------------------
qic(month, harms, days,
    data     = gtt,
    chart    = 'u',
    multiply = 1000,
    title    = 'Patient harm (U chart)',
    ylab     = 'Adverse events per 1000 patient days',
    xlab     = 'Month')

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(dplyr))

gtt_by_month <- gtt %>%
  mutate(harmed = harms > 0) %>% 
  group_by(month) %>% 
  summarise(harms    = sum(harms),
            days     = sum(days),
            n.harmed = sum(harmed),
            n        = n())

head(gtt_by_month)

## ------------------------------------------------------------------------
qic(month, n.harmed,
    n         = n,
    data      = gtt_by_month,
    y.percent = TRUE,
    title     = 'Harmed patients',
    ylab      = NULL,
    xlab      = 'Month')

## ------------------------------------------------------------------------
qic(month, n.harmed, n,
    data      = gtt_by_month,
    chart     = 'p',
    y.percent = TRUE,
    title     = 'Harmed patients (P chart)',
    ylab      = NULL,
    xlab      = 'Month')

## ---- eval=FALSE---------------------------------------------------------
#  qic(month,
#      harms > 0,        # TRUE if patient had one or more harms
#      days > 0,         # Always TRUE
#      data      = gtt,
#      chart     = 'p',
#      y.percent = TRUE,
#      title     = 'Harmed patients (P chart)',
#      ylab      = NULL,
#      xlab      = 'Month')

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(tidyr))

gtt_ae_types <- gtt %>%
  gather(severity, category, E:I) %>% 
  filter(complete.cases(.))

head(gtt_ae_types)

## ------------------------------------------------------------------------
paretochart(gtt_ae_types$category,
            title = 'Pareto chart of harm category')

## ------------------------------------------------------------------------
paretochart(gtt_ae_types$severity,
            title = 'Pareto chart of harm severity')

## ------------------------------------------------------------------------
head(cdi)

## ------------------------------------------------------------------------
qic(month, n,
    notes    = notes,
    data     = cdi,
    decimals = 0,
    title    = 'Hospital acquired Clostridium difficile infections',
    ylab     = 'Count',
    xlab     = 'Month')

## ------------------------------------------------------------------------
qic(month, n,
    data        = cdi,
    decimals    = 0,
    freeze      = 24,
    part.labels = c('Baseline', 'Intervention'),
    title       = 'Hospital acquired Clostridium difficile infections',
    ylab        = 'Count',
    xlab        = 'Month')

## ------------------------------------------------------------------------
qic(month, n,
    data     = cdi,
    decimals = 0,
    part     = 24,
    title    = 'Hospital acquired Clostridium difficile infections',
    ylab     = 'Count',
    xlab     = 'Month')

## ------------------------------------------------------------------------
qic(month, n,
    data  = cdi,
    chart = 'c',
    part  = 24,
    title = 'Hospital acquired Clostridium difficile infections (C chart)',
    ylab  = 'Count',
    xlab  = 'Month')

## ------------------------------------------------------------------------
qic(month, n, days,
    data     = cdi,
    chart    = 'u',
    part     = 24,
    multiply = 10000, 
    title    = 'Hospital acquired Clostridium difficile infections (U chart)',
    ylab     = 'Cases per 10,000 risk days',
    xlab     = 'Month')

## ------------------------------------------------------------------------
head(cabg)

## ------------------------------------------------------------------------
qic(age,
    data      = tail(cabg, 100), 
    chart     = 'i',
    show.grid = TRUE,
    title     = 'Age of the last 100 patients (I chart)',
    ylab      = 'Years',
    xlab      = 'Patient #')

## ------------------------------------------------------------------------
qic(age,
    data      = tail(cabg, 100), 
    chart     = 'mr',
    show.grid = TRUE,
    title     = 'Age of the last 100 patients (MR chart)',
    ylab      = 'Years',
    xlab      = 'Patient #')

## ------------------------------------------------------------------------
qic(age,
    data    = tail(cabg, 100), 
    chart   = 'i',
    exclude = c(45, 70),
    title   = 'Age of the last 100 patients (I chart)',
    ylab    = 'Years',
    xlab    = 'Patient #')

## ------------------------------------------------------------------------
cabg <- cabg %>% 
  mutate(month = as.Date(cut(date, 'month')))

## ------------------------------------------------------------------------
qic(month, age,
    data  = cabg,
    chart = 'xbar',
    title = 'Average age (Xbar chart)',
    ylab  = 'Years',
    xlab  = 'Month')

## ------------------------------------------------------------------------
qic(month, age,
    data  = cabg,
    chart = 's',
    title = 'Age standard deviation (S chart)',
    ylab  = 'Years',
    xlab  = 'Month')

## ------------------------------------------------------------------------
cabg_by_month <- cabg %>% 
  group_by(month) %>% 
  summarise(deaths       = sum(death),
            readmissions = sum(readmission),
            n            = n())

head(cabg_by_month)

## ------------------------------------------------------------------------
qic(month, readmissions, n,
    data      = cabg_by_month,
    chart     = 'p',
    y.percent = TRUE,
    title     = 'Readmissions within 30 days (P chart)',
    ylab      = NULL,
    xlab      = 'Month')

## ------------------------------------------------------------------------
qic(month, deaths, n,
    data      = cabg_by_month,
    chart     = 'p',
    y.percent = TRUE,
    title     = '30 days mortality (P chart)',
    ylab      = NULL,
    xlab      = 'Month')

## ------------------------------------------------------------------------
fatalities <- cabg %>% 
  mutate(x = row_number()) %>% 
  filter(death) %>% 
  mutate(dd = x - lag(x),
         dt = date - lag(date))

head(fatalities)

## ------------------------------------------------------------------------
qic(dd,
    data  = fatalities,
    chart = 'g',
    title = 'Surgeries between deaths (G chart)',
    ylab  = 'Count',
    xlab  = 'Death #')

## ------------------------------------------------------------------------
qic(dt,
    data  = fatalities,
    chart = 't',
    title = 'Days between deaths (T chart)',
    ylab  = 'Days',
    xlab  = 'Death #')

## ------------------------------------------------------------------------
cabg_by_month_gender <- cabg %>% 
  group_by(month, gender) %>% 
  summarise(readmissions = sum(readmission),
            n            = n())

head(cabg_by_month_gender)

## ------------------------------------------------------------------------
qic(month, readmissions, n,
    data      = cabg_by_month_gender,
    facets    = ~ gender, 
    chart     = 'p',
    y.percent = TRUE,
    title     = 'Readmissions within 30 days (P chart)',
    ylab      = '',
    xlab      = 'Month')

## ------------------------------------------------------------------------
head(hospital_infections)

## ------------------------------------------------------------------------
qic(month, n, days,
    data     = hospital_infections,
    chart    = 'u',
    multiply = 10000,
    title    = 'Hospital acquired infections in the Capital Region of Denmark',
    ylab     = 'Cases per 10,000 risk days',
    xlab     = 'Month')

## ---- fig.height=2-------------------------------------------------------
qic(month, n, days,
    data     = hospital_infections,
    facets   = ~ infection,
    chart    = 'u',
    multiply = 10000,
    title    = 'Hospital acquired infections in the Capital Region of Denmark',
    ylab     = 'Cases per 10,000 risk days',
    xlab     = 'Month')

## ---- fig.height=4-------------------------------------------------------
qic(month, n, days,
    data     = hospital_infections,
    facets   = infection ~ hospital,
    chart    = 'u',
    multiply = 10000,
    scales   = 'free_y',
    x.angle  = 45,
    title    = 'Hospital acquired infections in the Capital Region of Denmark',
    ylab     = 'Cases per 10,000 risk days',
    xlab     = 'Month')

## ---- fig.height=7-------------------------------------------------------
hai_2016 <- hospital_infections %>% 
  filter(month    >= '2016-07-01') %>% 
  mutate(hospital = reorder(hospital, days))

qic(hospital, n, days,
    data            = hai_2016,
    facets          = ~ infection,
    ncol            = 1,
    scales          = 'free_y',
    chart           = 'u',
    multiply        = 10000,
    decimals        = 1,
    show.labels     = TRUE,
    title           = 'Hospital acquired bacteremia 2016 (U funnel chart)',
    ylab            = 'Cases per 10,000 risk days',
    xlab            = 'Hospital')

## ------------------------------------------------------------------------
head(nhs_accidents)

## ------------------------------------------------------------------------
qic(i, r, 
    n        = n, 
    data     = nhs_accidents, 
    chart    = 'p',
    decimals = 3,
    title    = 'Proportion of patients seen within 4 hours of attendance (P chart)',
    ylab     = NULL,
    xlab     = 'Week #')

## ------------------------------------------------------------------------
qic(i, r, 
    n        = n, 
    data     = nhs_accidents, 
    chart    = 'i',
    decimals = 3,
    title    = 'Proportion of patients seen within 4 hours of attendance (I chart)',
    ylab     = NULL,
    xlab     = 'Week #')

## ------------------------------------------------------------------------
qic(i, r, 
    n        = n, 
    data     = nhs_accidents, 
    chart    = 'pp',
    decimals = 3,
    title    = 'Proportion of patients seen within 4 hours of attendance (P\' chart)',
    ylab     = NULL,
    xlab     = 'Week #')

## ---- fig.width=3.45, fig.height=2.3, results='hold', echo=FALSE---------
qic(month, readmissions, 
    n         = n,
    data      = cabg_by_month,
    chart     = 'p',
    y.percent = TRUE,
    x.pad     = 6,
    title     = 'Readmissions (P chart)',
    ylab      = NULL,
    xlab      = 'Month')

qic(month, readmissions, 
    n         = n,
    data      = cabg_by_month,
    chart     = 'pp',
    y.percent = TRUE,
    x.pad     = 6,
    title     = 'Readmissions (P\' chart)',
    ylab      = NULL,
    xlab      = 'Month')

## ---- results='asis'-----------------------------------------------------
n <- 10:100
x <- data.frame(
  `Number of useful observations`       = n,
  `Upper limit for longest run`         = round(log2(n) + 3),
  `Lower limit for number of crossings` = qbinom(0.05, n - 1, 0.5),
  check.names                           = FALSE)

knitr::kable(x)

