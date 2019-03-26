library(MortalityTables)


### Name: mortalityTable.improvementFactors-class
### Title: Class mortalityTable.improvementFactors - Cohort life table with
###   improvement factors
### Aliases: mortalityTable.improvementFactors-class
###   mortalityTable.improvementFactors

### ** Examples

mortalityTables.load("Austria_Annuities_AVOe2005R")
# AVOe 2005R base table with yearly improvements of 3% for age 0, linearly
# decreasing to 0% for age 120.
tb = mortalityTable.improvementFactors(
    ages = ages(AVOe2005R.male),
    deathProbs = periodDeathProbabilities(AVOe2005R.male, Period = 2002),
    baseYear = 2002,
    improvement = 0.03 * (1 - ages(AVOe2005R.male)/121),
    name = "AVOe 2005R base with linearly falling improvements (DEMO)"
)
# Yearly trend is declining:
plotMortalityTrend(tb, AVOe2005R.male, Period = 2017, title = "Mortality Trend")
# The cohort tables for different birth years:
plot(getCohortTable(tb, YOB = 1963), getCohortTable(tb, YOB = 2017))




