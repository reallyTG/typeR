library(MortalityTables)


### Name: plotMortalityTables
### Title: Plot multiple mortality tables (life tables) in one plot
### Aliases: plotMortalityTables

### ** Examples

# Load the Austrian census data
mortalityTables.load("Austria_Annuities")
mortalityTables.load("Austria_Census")

# Plot some select census tables in a log-linear plot (plot called
# with mortalityTable objects is equla to calling plotMortalitytTables directly)
plot(mort.AT.census.1869.male, mort.AT.census.1869.female,
     mort.AT.census.1971.male, mort.AT.census.1971.female,
     mort.AT.census.2011.male, mort.AT.census.2011.female,
     title="Austrian census tables",
     ylab=expression(q[x]), xlab="Age",
     xlim=c(0,90),
     legend.position=c(0.95,0.05))

# To compare period or cohort life tables, use the YOB and Period arguments:
plot(AVOe2005R.male, AVOe2005R.female, AVOe1996R.male, AVOe1996R.female,
    Period = 2018, title = "Austrian Annuity Tables, Period 2018")
plot(AVOe2005R.male, AVOe2005R.female, AVOe1996R.male, AVOe1996R.female,
    YOB = 2000, title = "Austrian Annuity Tables for cohort YOB=2000")




