library(marima)


### Name: season.lagging
### Title: season.lagging
### Aliases: season.lagging

### ** Examples

set.seed(4711)
# generate bivariate time series
y<-round(matrix(10*rnorm(36), nrow=2))
y
# define new lagged variables (y3 and y4) with seasonalities 6 and 12
lagging <- c(1, 3, (6-1),  2, 4, (12-1)) 
season.lagging(y, lagging)




