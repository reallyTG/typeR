library(datarobot)


### Name: CreateBacktestSpecification
### Title: Create a list describing backtest parameters
### Aliases: CreateBacktestSpecification

### ** Examples

zeroDayDuration <- ConstructDurationString()
hundredDayDuration <- ConstructDurationString(days = 100)
CreateBacktestSpecification(index = 0,
                            gapDuration = zeroDayDuration,
                            validationStartDate = "1989-12-01",
                            validationDuration = hundredDayDuration)



