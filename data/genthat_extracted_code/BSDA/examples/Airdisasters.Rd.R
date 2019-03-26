library(BSDA)


### Name: Airdisasters
### Title: Aircraft disasters in five different decades
### Aliases: Airdisasters
### Keywords: datasets

### ** Examples


par(las = 1)
stripchart(deaths ~ decade, data = Airdisasters, 
           subset = decade != "1930s" & decade != "1940s", 
           method = "stack", pch = 19, cex = 0.5, col = "red", 
           main = "Aircraft Disasters 1950 - 1990", 
           xlab = "Number of fatalities")
par(las = 0)




