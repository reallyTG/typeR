library(govStatJPN)


### Name: get.stat.data
### Title: Object to Get Statistical Data of a Specified Survey.
### Aliases: get.stat.data
### Keywords: Japan Government API Open Data

### ** Examples

# stat.list <- get.stat.list(app.id, list(surveyYears=2007, lang='J'))
# stat.data <- get.stat.data(app.id, list(limit=100),stat.list$id[1])
# show data of the survey
# stat.data$value
# summation of data
# sum(stat.data$value$value)
# mean of data
# mean(stat.data$value$value)
# standard deviation of data
# sd(stat.data$value$value)

# get histogram
# hist(stat.data$value$value, breaks=25)



