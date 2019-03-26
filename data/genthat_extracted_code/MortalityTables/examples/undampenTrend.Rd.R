library(MortalityTables)


### Name: undampenTrend
### Title: Return a 'mortalityTable.trendProjection' object with the trend
###   damping removed.
### Aliases: undampenTrend
###   undampenTrend,mortalityTable.trendProjection-method

### ** Examples

mortalityTables.load("Austria_Annuities")
AVOe2005R.male.undamped = undampenTrend(AVOe2005R.male)
AVOe2005R.male.undamped@name = paste(AVOe2005R.male.undamped@name, "no trend dampening")

plot(AVOe2005R.male, AVOe2005R.male.undamped,
    title = "AVOe 2005R with trend dampening and without", YOB = 2000)




