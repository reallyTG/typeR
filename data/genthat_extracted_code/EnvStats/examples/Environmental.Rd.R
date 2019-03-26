library(EnvStats)


### Name: Environmental
### Title: Atmospheric Environmental Conditions in New York City
### Aliases: Environmental Environmental.df Air.df
### Keywords: datasets

### ** Examples

# Scatterplot matrix
pairs(Environmental.df)

pairs(Air.df)


# Time series plot for ozone
attach(Environmental.df)
dates <- as.Date(row.names(Environmental.df), format = "%m/%d/%Y")
plot(dates, ozone, type = "l", 
    xlab = "Time (Year = 1973)", ylab = "Ozone (ppb)",
    main = "Time Series Plot of Daily Ozone Measures")
detach("Environmental.df")
rm(dates)



