library(survutils)


### Name: get_nrisk_tbl
### Title: Returns a Number At Risk Table from a survfit Object
### Aliases: get_nrisk_tbl

### ** Examples

fit <- survival::survfit(survival::Surv(time,status) ~ rx, data = survival::colon)
get_nrisk_tbl(fit, timeby = 500)



