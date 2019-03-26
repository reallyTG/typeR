library(bayesPop)


### Name: pop.cohorts.plot
### Title: Extracting and Plotting Cohort Data
### Aliases: pop.cohorts.plot cohorts
### Keywords: hplot manip

### ** Examples

    sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
    pred <- get.pop.prediction(sim.dir)
    # Population cohorts
    pop.cohorts.plot(pred, "Netherlands")
    # plot specific cohorts using expression (must contain {})
    pop.cohorts.plot(pred, expression="P528{}", cohorts=c(1960, 1980, 2000, 2020))
    # the same as
    cohort.data <- cohorts(pred, expression="P528{}")
    pop.cohorts.plot(pred, cohort.data=cohort.data, cohorts=c(1960, 1980, 2000, 2020))



