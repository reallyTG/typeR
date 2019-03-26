library(extremefit)


### Name: Burr Distribution
### Title: Burr distribution
### Aliases: 'Burr Distribution' rburr dburr pburr qburr

### ** Examples

plot(function(x) dburr(x,3,1), 0, 5,ylab="density",
main = " burr density ")

plot(function(x) pburr(x,3,1), 0, 5,ylab="distribution function",
     main = " burr Cumulative ")

plot(function(x) qburr(x,3,1), 0, 1,ylab="quantile",
     main = " burr Quantile ")

#generate a sample of burr distribution of size n
n <- 100
x <- rburr(n, 1, 1)





