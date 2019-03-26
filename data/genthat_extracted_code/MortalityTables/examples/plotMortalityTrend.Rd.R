library(MortalityTables)


### Name: plotMortalityTrend
### Title: Plot the trends of multiple mortality tables (life tables) in
###   one chart
### Aliases: plotMortalityTrend

### ** Examples

# Load the Austrian aunnity data
mortalityTables.load("Austria_Annuities")

# Compare the trends of these tables
plotMortalityTrend(AVOe2005R.male, AVOe2005R.female, AVOe1996R.male, AVOe1996R.female,
    Period = 2002, title = "Trends of Austrian Annuity Tables")
# For tables with a non-constant trend, the Period and YOB can be used to compare
# the age-specific trends that apply to the death probabilities during a given
# period or for a given birth year
plotMortalityTrend(AVOe2005R.male, AVOe2005R.female, AVOe1996R.male, AVOe1996R.female,
    YOB = 1950, title = "Trends of Austrian Annuity Tables for cohort YOB=1950")
plotMortalityTrend(AVOe2005R.male, AVOe2005R.female, AVOe1996R.male, AVOe1996R.female,
    YOB = 2000, title = "Trends of Austrian Annuity Tables for cohort YOB=2000")
plotMortalityTrend(AVOe2005R.male, AVOe2005R.female, AVOe1996R.male, AVOe1996R.female,
   Period = 1999, title = "Trends of Austrian Annuity Tables for Period 2002")
plotMortalityTrend(AVOe2005R.male, AVOe2005R.female, AVOe1996R.male, AVOe1996R.female,
   Period = 2030, title = "Trends of Austrian Annuity Tables for Period 2030")
#' @import scales



