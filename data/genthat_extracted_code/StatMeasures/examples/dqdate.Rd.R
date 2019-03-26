library(StatMeasures)


### Name: dqdate
### Title: Data quality check of date variables
### Aliases: dqdate

### ** Examples

# A 'data.frame'
df <- data.frame(date = c('2012-11-21', '2015-1-4', '1996-4-30', '1979-9-23', '2005-5-13'),
                 temperature = c(26, 32, 35, 7, 14))

# Convert character date to date format
df[, 'date'] <- as.Date(df[, 'date'])

# Generate a data quality report of date variables
summaryDate <- dqdate(data = df)



