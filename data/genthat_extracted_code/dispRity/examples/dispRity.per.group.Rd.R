library(dispRity)


### Name: dispRity.per.group
### Title: Disparity in different groups.
### Aliases: dispRity.per.group

### ** Examples

## Load the Beck & Lee 2014 data
data(BeckLee_mat50)

## Run a simple disparity per group analysis comparing stem and crown mammals
result <- dispRity.per.group(BeckLee_mat50, list(crown = c(16, 19:41, 45:50),
                             stem = c(1:15, 17:18, 42:44)))
summary(result) ; plot(result)




