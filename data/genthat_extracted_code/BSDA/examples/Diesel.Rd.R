library(BSDA)


### Name: Diesel
### Title: Diesel fuel prices in 1999-2000 in nine regions of the country
### Aliases: Diesel
### Keywords: datasets

### ** Examples


par(las = 2)
boxplot(pricepergallon ~ location, data = Diesel)
boxplot(pricepergallon ~ location, 
       data = droplevels(Diesel[Diesel$location == "EastCoast" | 
       Diesel$location == "Gulf" | Diesel$location == "NatAvg" | 
       Diesel$location == "Rocky" | Diesel$location == "California", ]), 
       col = "pink", main = "Exercise 2.8")
par(las = 1) 
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Diesel, aes(x = date, y = pricepergallon, 
##D            color = location)) + 
##D            geom_point() + 
##D            geom_smooth(se = FALSE) + 
##D            theme_bw() + 
##D            labs(y = "Price per Gallon (in dollars)")
## End(Not run)         



