library(projections)


### Name: get_dates
### Title: Access content projections objects
### Aliases: get_dates get_dates.projections

### ** Examples



if (require(distcrete) && require(incidence)) { withAutoprint({

## prepare input: epicurve and serial interval
dat <- c(0, 2, 2, 3, 3, 5, 5, 5, 6, 6, 6, 6)
i <- incidence(dat)
si <- distcrete("gamma", interval = 1L,
                 shape = 1.5,
                 scale = 2, w = 0)


## make predictions
pred_1 <- project(i, 1.2, si, n_days = 30)
pred_1


## retrieve content
get_dates(pred_1)
max(i$dates) # predictions start 1 day after last incidence

})}



