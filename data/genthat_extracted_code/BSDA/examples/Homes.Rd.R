library(BSDA)


### Name: Homes
### Title: Median prices of single-family homes in 65 metropolitan
###   statistical areas
### Aliases: Homes
### Keywords: datasets

### ** Examples


tapply(Homes$price, Homes$year, mean)
tapply(Homes$price, Homes$region, mean)
p2000 <- subset(Homes, year == "2000")
p1994 <- subset(Homes, year == "1994")
## Not run: 
##D library(dplyr)
##D library(ggplot2)
##D dplyr::group_by(Homes, year, region) %>%
##D    summarize(AvgPrice = mean(price))
##D ggplot2::ggplot(data = Homes, aes(x = region, y = price)) + 
##D            geom_boxplot() + 
##D            theme_bw() + 
##D            facet_grid(year ~ .)
## End(Not run)





