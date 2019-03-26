library(MortalityTables)


### Name: mortalityComparisonTable
### Title: Calculate relative mortalities for age bands and birth years
### Aliases: mortalityComparisonTable

### ** Examples

mortalityTables.load("Austria_Annuities")
# Compare mortality of Austrian male and female annuitants born 1930 to 2030
mortalityComparisonTable(
    AVOe2005R.male, AVOe2005R.female,
    years = seq(1930, 2030, by = 10),
    ages = 0:119)

# Compare the two Austrian male annuity tables AVOe 2005-R and AVOe 1996-R,
# combining ages 10-19, 20-29, etc.
mortalityComparisonTable(
    AVOe2005R.male, AVOe1996R.male,
    years = seq(1930, 2030, by = 10),
    ages = 0:109, binsize=10)





