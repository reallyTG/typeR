## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- eval = FALSE-------------------------------------------------------
#  vignette("Report", package = "lifelogr")

## ------------------------------------------------------------------------
library(lifelogr)

## ---- eval = FALSE-------------------------------------------------------
#  EX <- Person$new(fitbit_user_email = "example@domain.com",
#                   fitbit_user_pw = "password",
#                   apple_data_file = "apple.csv",
#                   addl_data = NA,
#                   user_info = list("name" = "EX", "age" = 29, "gender" = "male"),
#                   target_steps = 10000,
#                   group_assignments = list(data.frame(NA), data.frame(NA)),
#                   start_date = "2017-01-19", end_date = "2017-02-17")

## ---- echo = FALSE-------------------------------------------------------
load("../data/EX.rda")

## ---- fig.show = "hold"--------------------------------------------------
plot_sleep_all(EX)

## ------------------------------------------------------------------------
plot_sleep(EX, "by_start_end_time", "day_of_week")

## ------------------------------------------------------------------------
plot_daily(EX, "steps")

## ------------------------------------------------------------------------
plot_intraday(EX, "distance", unit = "km")

## ------------------------------------------------------------------------
plot_intraday(EX, "bpm", FALSE)

## ---- fig.show = "hold"--------------------------------------------------
experiment(person = EX, 
           variables = list("fitbit_daily" = c("sleepDuration"),
                            "util" = c("day_of_week")),
           measures = list("fitbit_daily" = c("restingHeartRate")), 
           analysis = c("plot"),
           time_var = c("date"))

## ------------------------------------------------------------------------
experiment(person = EX,
           variables = list("fitbit_daily" = c("sleepDuration")),
           measures = list("fitbit_intraday" = c("distance")),
           analysis = c("correlation"),
           time_var = c("date"))

## ------------------------------------------------------------------------
    dataset <- create_dataset(person = EX,
                              all_variables = list("fitbit_daily" = c("sleepDuration"),
                                                   "fitbit_intraday" = c("distance")), 
                              time_var = c("date"))
    
    correlation_df <- correlation(dataset, person = EX, 
                                  variables = list("fitbit_daily" = c("sleepDuration")),
                                  measures = list("fitbit_intraday" = c("distance")),
                                  time_var = "date")

## ------------------------------------------------------------------------
experiment(person = EX,
           variables = list("fitbit_daily" = c("sleepDuration", "steps")),
           measures = list("fitbit_daily" = c("restingHeartRate")),
           analysis = c("anova"),
           time_var = c("date"))

## ------------------------------------------------------------------------
 dataset <- create_dataset(person = EX,
                      all_variables = list("util" = c("month"), 
                                           "fitbit_daily" = 
                                             c("sleepDuration", 
                                               "steps",
                                               "restingHeartRate")), 
                      time_var = c("date"))

indiv_months <- data.frame("month" = c("Jan", "Feb", "Mar", "Apr", "May",
                                      "Jun", "Jul", "Aug",
                                      "Sep", "Oct", "Nov", "Dec"),
                           "group" = c(1:12))

compare_groups(dataset, person = EX, 
                     addl_grouping_assignments = list("indiv_months" = 
                                                        indiv_months), 
                     names_of_groupings = c("indiv_months"),
                     variables_to_compare = c("steps", "restingHeartRate"))

## ------------------------------------------------------------------------
experiment(person = EX,
               variables = list("fitbit_daily" = c("steps")),
               measures = list("fitbit_daily" = c("restingHeartRate")),
               analysis = c("regression"),
               time_var = c("date"))

