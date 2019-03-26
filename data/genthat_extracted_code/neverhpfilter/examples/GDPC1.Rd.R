library(neverhpfilter)


### Name: GDPC1
### Title: Gross Domestic Product
### Aliases: GDPC1
### Keywords: datasets

### ** Examples

data(GDPC1)
log_RGDP <- 100*log(GDPC1)

gdp_cycle <- yth_filter(log_RGDP, h = 8, p = 4, output = c("cycle", "random"), family = gaussian)

main <- "Log of Real GDP cycle and random walk"
plot(gdp_cycle, grid.col = "white", legend.loc = "topright", main = main)



