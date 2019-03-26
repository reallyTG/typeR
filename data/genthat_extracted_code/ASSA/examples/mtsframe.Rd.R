library(ASSA)


### Name: mtsframe
### Title: Multivariate Time Series Frame Objects
### Aliases: mtsframe mtsframe.default
### Keywords: multivariate time series formatting.

### ** Examples

data(brexit)
attach(brexit)
y <- mtsframe(date, Y = brexit[, 1:3])
print(y)
# Ploting the time series under study (blue = Leave, red = Stay, black = Undecided)
plot(y, col = c('blue', 'red', 'black'), time.format = '%m-%y')
# When 'date' is a time index, the time.format specification is omitted.



