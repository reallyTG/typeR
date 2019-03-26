library(MortalityTables)


### Name: plotMortalityTableComparisons
### Title: Plot multiple mortality tables (life tables) in one plot,
###   relative to a given reference table
### Aliases: plotMortalityTableComparisons

### ** Examples

# Load the Austrian census data
mortalityTables.load("Austria_Census")

# Compare some census tables with the mortality of 2011 Austrian males
# plot with the reference argument is the same as calling plotMortalityTableComparisons
plot(mort.AT.census.1869.male, mort.AT.census.1869.female,
     mort.AT.census.1971.male, mort.AT.census.1971.female,
     mort.AT.census.2011.male, mort.AT.census.2011.female,
     title = "Austrian Census tables, relative to 1971 males",
     reference = mort.AT.census.1971.male)
plotMortalityTableComparisons(mort.AT.census.1869.male, mort.AT.census.1869.female,
     mort.AT.census.1971.male, mort.AT.census.1971.female,
     mort.AT.census.2011.male, mort.AT.census.2011.female,
     title = "Austrian Census tables, relative to 1971 males",
     reference = mort.AT.census.1971.male)




