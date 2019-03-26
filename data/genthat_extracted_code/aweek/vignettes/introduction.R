## ----date2week-----------------------------------------------------------
library("aweek")

set.seed(2019-03-03)
dat <- as.Date("2019-03-03") + sample(-6:7, 10, replace = TRUE)
dat
# Use character days
print(w <- date2week(dat, week_start = "Sunday"))
# Use ISO 8601 days
print(w <- date2week(dat, week_start = 7))

## ----date2week2date------------------------------------------------------
week2date(w)

## ----aweek---------------------------------------------------------------
x <- "2019-W10-1"
attr(x, "week_start") <- 7 # monday
class(x) <- "aweek"
x
class(x)

## ----ascharacter---------------------------------------------------------
as.character(x)

## ----date2week_floor-----------------------------------------------------
print(wf <- date2week(dat, week_start = "Saturday", floor_day = TRUE))
table(wf)

## ----date2week_floor2date------------------------------------------------
print(dwf <- week2date(wf))
weekdays(dwf)

## ----factors-------------------------------------------------------------
date2week(Sys.Date() + c(0, 15), week_start = 1, factor = TRUE)
date2week(Sys.Date() + c(0, 15), week_start = 1, factor = TRUE, floor_day = TRUE)

## ----week2week-----------------------------------------------------------
w # week starting on Sunday
date2week(w, week_start = "wednesday")

# create a table with all days in the week
res <- as.data.frame(matrix("", nrow = 10, ncol = 7), stringsAsFactors = FALSE)
names(res) <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
for (i in names(res)) res[[i]] <- date2week(w, week_start = i)
as.data.frame(res)

## ----week2date-----------------------------------------------------------
week2date("2019-W10-1", week_start = "Sunday") # 2019-03-03
week2date("2019-W10-1", week_start = "Monday") # 2019-03-04

## ----week2date_aweek-----------------------------------------------------
week2date(w)

## ----asdate--------------------------------------------------------------
as.Date(w)
as.POSIXlt(w)

