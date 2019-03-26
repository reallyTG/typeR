## ---- options, echo = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width=7, 
  fig.height=5 
)


## ---- data---------------------------------------------------------------
library(incidence)
set.seed(1)
dat <- sample(1:50, 200, replace = TRUE, prob = 1 + exp(1:50 * 0.1))
sex <- sample(c("female", "male"), 200, replace = TRUE)

## ---- i------------------------------------------------------------------
i <- incidence(dat, interval = 2)
i
plot(i)

## ---- sex----------------------------------------------------------------
i.sex <- incidence(dat, interval = 2, group = sex)
i.sex
plot(i.sex)

## ---- names--------------------------------------------------------------
class(i)
is.list(i)
names(i)

## ---- access-------------------------------------------------------------
## use name
head(i$dates)

head(get_dates(i))

## ---- dates1-------------------------------------------------------------
date_bins <- get_dates(i)
class(date_bins)
class(dat)

date_bins

## ----date-dates1---------------------------------------------------------
dat_Date <- as.Date("2018-10-31") + dat
head(dat_Date)
i.date <- incidence(dat_Date, interval = 2, group = sex)
i.date
get_dates(i.date)
class(get_dates(i.date))

## ----get-dates-integer---------------------------------------------------
get_dates(i.date, count_days = TRUE)
get_dates(i, count_days = TRUE)

## ----get-dates-center----------------------------------------------------
get_dates(i.date, position = "center")
get_dates(i.date, position = "center", count_days = TRUE)

## ---- counts1------------------------------------------------------------
counts <- get_counts(i)
class(counts)
storage.mode(counts)

counts
get_counts(i.sex)

## ----counts1.1-----------------------------------------------------------
dim(get_counts(i.sex))
dim(i.sex)
nrow(i.sex) # number of date bins
ncol(i.sex) # number of groups

## ----groups--------------------------------------------------------------
# Number of groups
ncol(i.sex)
ncol(i)

# Names of groups
group_names(i.sex)
group_names(i)

# You can also rename the groups
group_names(i.sex) <- c("F", "M")
group_names(i.sex)

## ---- as.data.frame------------------------------------------------------
## basic conversion
as.data.frame(i)
as.data.frame(i.sex)

## long format for ggplot2
as.data.frame(i.sex, long = TRUE)

## ---- timespan-----------------------------------------------------------
get_timespan(i)
print(date_range <- range(get_dates(i)))
diff(date_range) + 1

## ---- interval-----------------------------------------------------------
get_interval(i)
diff(get_dates(i))

## ---- n------------------------------------------------------------------
get_n(i)

## ---- n2-----------------------------------------------------------------
colSums(get_counts(i.sex))

## ---- isoweek------------------------------------------------------------
library(outbreaks)
dat <- ebola_sim$linelist$date_of_onset
i.7 <- incidence(dat, 7L, standard = TRUE)
i.7
i.7$isoweeks

## ----isoweek-null--------------------------------------------------------
i$isoweeks

## ---- isoweek2-----------------------------------------------------------
head(with(i.7, cbind.data.frame(dates, isoweeks)))

## ---- isoweek3-----------------------------------------------------------
head(as.data.frame(i.7))

