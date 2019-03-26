library(tsoutliers)


### Name: calendar.effects
### Title: Calendar Effects
### Aliases: calendar.effects
### Keywords: ts

### ** Examples

# display calendar effects for a sample span period
# no data are actually necessary in the input series 
# since calendar effects are concerned only with the dates
# at which the data are sampled
x <- ts(frequency = 12, start = c(1980, 1), end = c(2000, 12))
ce <- calendar.effects(x, leap.year = TRUE)
colnames(ce)
plot(ce, main = "calendar effects")
# Easter days for each year
calendar.effects(x, easter.date = TRUE)$easter



