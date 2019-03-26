library(StatMeasures)


### Name: dqcategorical
### Title: Data quality check of categorical variables
### Aliases: dqcategorical

### ** Examples

# A 'data.frame'
df <- data.frame(phone = c('IP', 'SN', 'HO', 'IP', 'SN', 'IP', 'HO', 'SN', 'IP', 'SN'),
                 colour = c('black', 'blue', 'green', 'blue', 'black', 'silver', 'black',
                 'white', 'black', 'green'))

# Factorise categorical variables
df <- factorise(data = df, colNames = c('phone', 'colour'))

# Generate a data quality report of continuous variables
summaryCategorical <- dqcategorical(data = df)



