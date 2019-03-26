library(dataPreparation)


### Name: generateFactorFromDate
### Title: Generate factor from dates
### Aliases: generateFactorFromDate

### ** Examples

# Load set, and find dates
data(messy_adult)
messy_adult <- findAndTransformDates(messy_adult, verbose = FALSE)

# Generate new columns
# Generate year month columns
messy_adult <- generateFactorFromDate(messy_adult, cols = c("date1", "date2", "num1"))
head(messy_adult[, .(date1.yearmonth, date2.yearmonth)])


# Generate quarter columns
messy_adult <- generateFactorFromDate(messy_adult, cols = c("date1", "date2"), type = "quarter")
head(messy_adult[, .(date1.quarter, date2.quarter)])



