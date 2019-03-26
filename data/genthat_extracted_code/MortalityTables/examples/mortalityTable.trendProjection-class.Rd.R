library(MortalityTables)


### Name: mortalityTable.trendProjection-class
### Title: Class mortalityTable.trendProjection - Cohort mortality table
###   with age-specific trend
### Aliases: mortalityTable.trendProjection-class
###   mortalityTable.trendProjection

### ** Examples

obsTable = mortalityTable.trendProjection(
    name = "Const. table with trend",
    baseYear = 2018,
    ages = 0:15,
    deathProbs = rep(0.02, 16),
    trend = c(
         0.045, 0.04, 0.03, 0.04, 0.042, 0.041, 0.038, 0.035,
         0.032, 0.031, 0.028, 0.020, 0.015, 0.01, 0.005, 0))
# In 2018 the flat mortality can be seen
plotMortalityTables(obsTable, Period = 2018, title = "Period death probabilities 2018")
# In 2038, the age-specific trend affected the probabilities differently for 20 years:
plotMortalityTables(obsTable, Period = 2038, title = "Period death probabilities 2038")
# Consequently, a person born 2018 will also not have constand death probabilities
plotMortalityTables(obsTable, YOB = 2018, title = "Cohort death probabilities, YOB 2018")

plotMortalityTables(
    lapply(2018:2033, function(y) getCohortTable(obsTable, YOB = y)),
    title = "Cohort tables for different YOBs", legend.position = c(0.99, 0.01))
plotMortalityTables(
   lapply(2018:2033, function(y) getPeriodTable(obsTable, Period = y)),
   title = "Period tables for different years", legend.position = c(0.99, 0.01))





