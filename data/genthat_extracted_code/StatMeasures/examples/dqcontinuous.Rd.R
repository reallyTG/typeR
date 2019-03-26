library(StatMeasures)


### Name: dqcontinuous
### Title: Data quality check of continuous variables
### Aliases: dqcontinuous

### ** Examples

# A 'data.frame'
df <- data.frame(x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                 y = c(22, NA, 66, 12, 78, 34, 590, 97, 56, 37))

# Generate a data quality report of continuous variables
summaryContinuous <- dqcontinuous(data = df)



