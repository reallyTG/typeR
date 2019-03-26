library(MortalityTables)


### Name: mortalityTable.mixed-class
### Title: Class mortalityTable.mixed - Life table as a mix of two life
###   tables
### Aliases: mortalityTable.mixed-class mortalityTable.mixed

### ** Examples

mortalityTables.load("Austria_Annuities_AVOe2005R")
# Generate a unisex table with mixing relation 60:40 from male + female tables
AVOe2005R.myUnisex = mortalityTable.mixed(
    table1 = AVOe2005R.male, table2 = AVOe2005R.female,
    weight1 = 0.6, weight2 = 0.4,
    name = "My custom AVOe 2005R unisex (60:40)")
plot(AVOe2005R.myUnisex, AVOe2005R.male, AVOe2005R.female, Period = 2017)



