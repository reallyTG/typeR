library(PASWR2)


### Name: CARS2004
### Title: Cars in the European Union (2004)
### Aliases: CARS2004
### Keywords: datasets

### ** Examples

plot(deaths ~ cars, data = CARS2004)
ggplot(data = CARS2004, aes(x = population, y = deaths, color = cars)) + geom_point()



