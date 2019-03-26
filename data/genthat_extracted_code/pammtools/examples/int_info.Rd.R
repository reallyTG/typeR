library(pammtools)


### Name: int_info
### Title: Create start/end times and interval information
### Aliases: int_info int_info.default int_info.ped int_info.pamm
### Keywords: internal

### ** Examples

## create interval information from cut points
int_info(c(1, 2.3, 5))

## extract interval information used to create ped object
tdf <- data.frame(time=c(1, 2.3, 5), status=c(0, 1, 0))
ped <- tdf %>% as_ped(Surv(time, status)~., id="id")
int_info(ped)




