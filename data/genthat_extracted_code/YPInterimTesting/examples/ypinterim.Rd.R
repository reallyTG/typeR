library(YPInterimTesting)


### Name: ypinterim
### Title: The main function of the package performing the adaptively
###   weighted log-rank test for interim monitoring
### Aliases: ypinterim ypinterim.default summary.ypinterim print.ypinterim

### ** Examples

library(YPInterimTesting)
data(virtual_data)

time <- virtual$time
event <- virtual$event
group <- virtual$group

spendfun <- c(1.3E-5, 4.4E-4, 0.003, 0.008)

result_all <- ypinterim(time, event, group, spendfun=spendfun)
result_all
summary(result_all)

## The example shows how to test the package with a historical data where 
## interim data at all looks are available.

## When calculating the boundary at the first look,
## the spending function value at the first look is needed:

time <- virtual$time[, 1]
event <- virtual$event[, 1]
group <- virtual$group

spendfun <- c(1.3E-5)

result_look1 <- ypinterim(time, event, group, spendfun=spendfun)
result_look1
summary(result_look1)

## When calculating the boundary at the second look,
## the spending function at the two looks,
## and boundary at the first look, should be supplied:

time <- virtual$time[, 1:2]
event <- virtual$event[, 1:2]
group <- virtual$group

spendfun <- c(1.3E-5, 4.4E-4)
critvalue <- c(4.36) # the boundary of the first look is supplied.

result_look2 <- ypinterim(time, event, group, spendfun=spendfun, critvalue = critvalue)
result_look2
summary(result_look2)

## Similarly, when calculating the boundary at the third look,
## the spending function at the three looks, and boundaries
## at the first two looks, should be supplied:
time <- virtual$time[, 1:3]
event <- virtual$event[, 1:3]
group <- virtual$group

spendfun <- c(1.3E-5, 4.4E-4, 0.003)
critvalue <- c(4.36, 3.42) # the boundaries at the first two looks are supplied.

result_look3 <- ypinterim(time, event, group, spendfun=spendfun, critvalue = critvalue)
result_look3
summary(result_look3)




