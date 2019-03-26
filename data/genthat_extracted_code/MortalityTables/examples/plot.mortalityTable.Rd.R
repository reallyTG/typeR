library(MortalityTables)


### Name: plot.mortalityTable
### Title: Plot multiple mortality tables (life tables) in one plot
### Aliases: plot.mortalityTable

### ** Examples

# Load the Austrian census data
mortalityTables.load("Austria_Census")

# Plot some select census tables in a log-linear plot
plot(mort.AT.census.1869.male, mort.AT.census.1869.female,
     mort.AT.census.1971.male, mort.AT.census.1971.female,
     mort.AT.census.2011.male, mort.AT.census.2011.female,
     title="Austrian census tables",
     ylab=expression(q[x]), xlab="Age",
     xlim=c(0,90),
     legend.position=c(0.95,0.05))

# Compare some census tables with the mortality of 2011 Austrian males
plot(mort.AT.census.1869.male, mort.AT.census.1869.female,
     mort.AT.census.1971.male, mort.AT.census.1971.female,
     mort.AT.census.2011.male, mort.AT.census.2011.female,
     title="Austrian Census tables, relative to 2011 males",
     reference=mort.AT.census.2011.male)




