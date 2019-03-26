## ----vignette_view, message = FALSE, eval = FALSE------------------------
#  library(constellation)
#  vignette("identify_sepsis", package = "constellation")

## ----setup, message = FALSE----------------------------------------------
library(constellation)
library(data.table)

## ----timestamps, message = FALSE-----------------------------------------
for (dt in list(vitals, labs, orders)) {
    date_col <- grep("TIME", names(dt), value = TRUE)
    set(dt, j = date_col, value = as.POSIXct(dt[[date_col]], format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"))
}

## ----bp_drop, message = FALSE--------------------------------------------
systolic_bp <- vitals[VARIABLE == "SYSTOLIC_BP"]

systolic_bp_drop <- value_change(systolic_bp, value = 40, direction = "down",
    window_hours = 6, join_key = "PAT_ID", time_var = "RECORDED_TIME",
    value_var = "VALUE", mult = "all")
head(systolic_bp_drop)

## ----sirs_components-----------------------------------------------------
temp <- vitals[VARIABLE == "TEMPERATURE" & (VALUE > 100.4 | VALUE < 96.8)]
pulse <- vitals[VARIABLE == "PULSE" & VALUE > 90]
resp <- vitals[VARIABLE == "RESPIRATORY_RATE" & VALUE > 20]
wbc <- labs[VARIABLE == "WBC" & (VALUE > 12 | VALUE < 4)]

## ----sirs_calculate, message = FALSE-------------------------------------
sirs <- constellate_criteria(temp, pulse, resp, wbc,
        criteria_names = c("TEMPERATURE", "PULSE", "RESPIRATORY_RATE", "WBC"),
        window_hours = c(6, 6, 6, 24), join_key = "PAT_ID",
        time_var = "RECORDED_TIME")
head(sirs)

## ----sirs_sum, message = FALSE-------------------------------------------
sirs[, SIRS_SCORE := TEMPERATURE + PULSE + RESPIRATORY_RATE + WBC]
sirs <- sirs[SIRS_SCORE >= 2]
head(sirs)

## ----end_organ, message = FALSE------------------------------------------
## Subset values
end_organ <- labs[
    (VARIABLE == "CREATININE" & VALUE > 2.0) |
    (VARIABLE == "INR" & VALUE > 1.5) |
    (VARIABLE == "BILIRUBIN" & VALUE > 2.0) |
    (VARIABLE == "PLATELETS" & VALUE < 100) |
    (VARIABLE == "LACTATE" & VALUE >= 2.0)
    ]

## normalize systolic_bp_drop
systolic_bp_drop <- systolic_bp_drop[,.(PAT_ID, CURRENT_RECORDED_TIME, CURRENT_VALUE)]
systolic_bp_drop[, VARIABLE := "SYSTOLIC_BP_DROP"]
setnames(systolic_bp_drop, c("CURRENT_RECORDED_TIME", "CURRENT_VALUE"), c("RECORDED_TIME", "VALUE"))

## subset low systolic_bp
systolic_bp <- systolic_bp[VALUE < 90]

## Combine SBP drop and < 90
end_organ <- rbind(end_organ, systolic_bp, systolic_bp_drop)

## ----bc_orders, message = FALSE------------------------------------------
setnames(orders, "ORDER_TIME", "RECORDED_TIME")

## ----sepsis_def_first, message = FALSE-----------------------------------
## Find first sepsis events
sepsis <- constellate(sirs, orders, end_organ, window_hours = c(24, 24, 24),
    join_key = "PAT_ID", time_var = "RECORDED_TIME", event_name = "SEPSIS",
    mult = "first")
head(sepsis)

## ----sepsis_def_last, message = FALSE------------------------------------
## Find last sepsis events
sepsis <- constellate(sirs, orders, end_organ, window_hours = c(24, 24, 24),
    join_key = "PAT_ID", time_var = "RECORDED_TIME", event_name = "SEPSIS",
    mult = "last")
head(sepsis)

## ----sepsis_def_all, message = FALSE-------------------------------------
## Find all sepsis events
sepsis <- constellate(sirs, orders, end_organ, window_hours = c(24, 24, 24),
    join_key = "PAT_ID", time_var = "RECORDED_TIME", event_name = "SEPSIS",
    mult = "all")
head(sepsis)

## ----sepsis_incidents, message = FALSE-----------------------------------
## Find incident sepsis events for each patient
sepsis <- incidents(sepsis, window_hours = 72, time_var = "SEPSIS_TIME", join_key = "PAT_ID")
head(sepsis)

