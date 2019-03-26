library(StreamMetabolism)


### Name: window_chron
### Title: Time Windows of Diurnal Curves
### Aliases: window_chron
### Keywords: chron

### ** Examples

#with real data
data(DOTemp)
d <- window_chron(DOTemp, "8/18/70", "06:00:00", "8/18/70", "20:15:00")
plot(d)



