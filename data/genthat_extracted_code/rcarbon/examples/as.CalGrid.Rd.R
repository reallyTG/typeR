library(rcarbon)


### Name: as.CalGrid
### Title: Convert data to class CalGrid.
### Aliases: as.CalGrid

### ** Examples

df <- data.frame(calBP=5000:2000,PrDens=runif(length(5000:2000)))
mycalgrid <- as.CalGrid(df)
plot(mycalgrid)



